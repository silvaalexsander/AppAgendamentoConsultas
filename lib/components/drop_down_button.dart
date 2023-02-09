import 'package:agendamentohospitalar/models/scheduling.dart';
import 'package:agendamentohospitalar/models/scheduling_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/hospital_list.dart';
import '../models/modal.dart';
import '../models/profissionals_list.dart';
import '../models/specialty_list.dart';
import 'package:intl/intl.dart';

class DrowpDownButton extends StatefulWidget {
  
  const DrowpDownButton({super.key});

  @override
  State<DrowpDownButton> createState() => _DrowpDownButtonState();
}

class _DrowpDownButtonState extends State<DrowpDownButton> {
  String? hospitalSelected = '';
  int? idHospital;
  String? profissionalSelected = '';
  int? idProfissional;
  String? specialtySelected = '';
  int? idSpecialty;
  String? horarioMarcado = '';
  String? horarioSelected = 'Selecione um Horário';
  DateTime? _selectedDate;
  bool exibButton = false;
  List<String> horarios = [
    '08:00:00',
    '09:00:00',
    '10:00:00',
    '11:00:00',
    '13:00:00',
    '14:00:00',
    '15:00:00',
    '16:00:00'
  ];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    iniciaLista();
  }

  iniciaLista() async {
    var specialtyList = Provider.of<SpecialtyList>(context, listen: false);
    var hospitalList = Provider.of<HospitalList>(context, listen: false);
    var professionalList =
        Provider.of<ProfissionalList>(context, listen: false);

    if (specialtyList.items.isEmpty) {
      await specialtyList.fetchSpecialties();
    }

    if (hospitalList.items.isEmpty) {
      await hospitalList.fetchHospitals();
    }

    if (professionalList.items.isEmpty) {
      await professionalList.fetchProfissionals();
    }

    if (professionalList.items.isNotEmpty &&
        hospitalList.items.isNotEmpty &&
        specialtyList.items.isNotEmpty) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arg = ModalRoute.of(context)?.settings.arguments;
    if (arg != null) {
      final schedulingData = arg as Scheduling;
      String horario = DateFormat('HH:mm:ss')
          .format(schedulingData.dataHoraAgendamento)
          .toString();
      horarioMarcado = horario;
      setState(() {
        idHospital = schedulingData.idHospital;
        idProfissional = schedulingData.idProfissional;
        idSpecialty = schedulingData.idEspecialidade;
        hospitalSelected = schedulingData.idHospitalNavigation!.nome;
        profissionalSelected = schedulingData.idProfissionalNavigation!.nome;
        specialtySelected = schedulingData.idEspecialidadeNavigation!.nome;
        horarioSelected = horario;
        _selectedDate = schedulingData.dataHoraAgendamento;
        exibButton = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final hospitalList = Provider.of<HospitalList>(context);
    final profissionalList = Provider.of<ProfissionalList>(context);
    final specialtyList = Provider.of<SpecialtyList>(context);
    final schedulingList = Provider.of<ScheduligList>(context);

    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                child: DropdownButtonFormField(
                  hint: Text(hospitalSelected!),
                  items: hospitalList.items.map((hospital) {
                    return DropdownMenuItem(
                      value: hospital.nome,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            hospital.nome,
                            style: const TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          idHospital = hospital.idHospital;
                        });
                      },
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      hospitalSelected = val.toString();
                    });
                  },
                  icon: const Icon(Icons.local_hospital_outlined,
                      color: Colors.red),
                  decoration: InputDecoration(
                    labelText: 'Hospital',
                    labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 23),
                    border: const OutlineInputBorder(),
                    focusColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),

              //ESPECIALIDADE
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                child: DropdownButtonFormField(
                  hint: Text(specialtySelected!),
                  items: specialtyList.items.map((specialty) {
                    return DropdownMenuItem(
                      value: specialty.nome,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(specialty.nome,
                              style: const TextStyle(fontSize: 17)),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          idSpecialty = specialty.idEspecialidade;
                          // print(idSpecialty);
                        });
                      },
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      specialtySelected = val.toString();
                    });
                  },
                  icon: Icon(Icons.man_outlined,
                      color: Theme.of(context).colorScheme.primary),
                  decoration: InputDecoration(
                    labelText: 'Especialidade',
                    labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 23),
                    border: const OutlineInputBorder(),
                    focusColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),

              //PROFISSIONAIS
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                child: DropdownButtonFormField(
                  hint: Text(profissionalSelected!),
                  items: profissionalList.items.map((profissional) {
                    return DropdownMenuItem(
                      value: profissional.nome,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(profissional.nome,
                              style: const TextStyle(fontSize: 17)),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          idProfissional = profissional.idProfissional;
                        });
                      },
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      profissionalSelected = val.toString();
                    });
                  },
                  icon: Icon(
                    Icons.supervisor_account_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Profissional',
                    labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 23),
                    border: const OutlineInputBorder(),
                    focusColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 180)),
                            ).then(
                              (pickedDate) {
                                setState(() {
                                  if (pickedDate != null) {
                                    _selectedDate = pickedDate;
                                  }
                                });
                              },
                            );
                          },
                          child: const Text('Selecionar Data'),
                        ),
                        if (_selectedDate != null)
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_outlined,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              DropdownButton(
                                hint: Text('$horarioSelected'),
                                items: horarios.map(
                                  (hora) {
                                    return DropdownMenuItem(
                                      value: hora,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(hora,
                                              style: const TextStyle(
                                                  fontSize: 17)),
                                        ],
                                      ),
                                    );
                                  },
                                ).toList(),
                                onChanged: (val) {
                                  setState(
                                    () {
                                      horarioSelected = val.toString();
                                      horarioMarcado = val.toString();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  if (_selectedDate != null)
                    Column(
                      children: [
                        const Text('Data e horários selecionados:',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        Text(
                          DateFormat('dd/MM/y').format(_selectedDate!),
                          style: TextStyle(
                              fontSize: 17,
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$horarioSelected',
                          style: TextStyle(
                              fontSize: 17,
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                ],
              ),
              if (_selectedDate != null &&
                  hospitalSelected != '' &&
                  profissionalSelected != '' &&
                  specialtySelected != '' &&
                  horarioMarcado != '' &&
                  (exibButton == false))
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // print(specialtyList.items.length);
                          // print(idSpecialty);
                          Modal.confirmBottomSheet(
                            context,
                            idSpecialty!,
                            idProfissional!,
                            idHospital!,
                            hospitalSelected!,
                            profissionalSelected!,
                            specialtySelected!,
                            _selectedDate!,
                            horarioMarcado!,
                          );
                        },
                        child: const Text('Confirmar Agendamento'),
                      ),
                    ],
                  ),
                ),
              if (exibButton == true)
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          final arg =
                              ModalRoute.of(context)?.settings.arguments;
                          final schedulingData = arg as Scheduling;
                          schedulingList.update(
                              schedulingData.idAgendamento,
                              idSpecialty!,
                              idProfissional!,
                              idHospital!,
                              horarioMarcado!,
                              _selectedDate!);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Atualizar Agendamento'),
                      ),
                    ],
                  ),
                ),
            ],
          );
  }
}
