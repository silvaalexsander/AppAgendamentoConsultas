import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/scheduling.dart';

class QueryDetailPage extends StatelessWidget {
  const QueryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scheduling = ModalRoute.of(context)?.settings.arguments as Scheduling;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Consulta'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 15, right: 15, bottom: 25),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Paciente',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        scheduling.idBeneficiarioNavigation!.nome,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, left: 15, right: 15, bottom: 25),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Especialidade',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.medical_information,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        scheduling.idEspecialidadeNavigation!.nome,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, left: 15, right: 15, bottom: 25),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Profissional',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.medication_liquid_sharp,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        scheduling.idProfissionalNavigation!.nome,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, left: 15, right: 15, bottom: 25),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Data',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            DateFormat('dd/MM/yyyy')
                                .format(scheduling.dataHoraAgendamento),
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 60),
                            child: Icon(
                              Icons.access_time,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Text(scheduling.horario.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, left: 15, right: 15, bottom: 25),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Hospital',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.local_hospital_rounded,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        scheduling.idHospitalNavigation!.nome,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, left: 15, right: 15, bottom: 25),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Telefone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        scheduling.idHospitalNavigation!.telefone,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, left: 15, right: 15, bottom: 25),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Endereço',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.business,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Container(
                          constraints: const BoxConstraints(
                            maxWidth: 290,
                          ),
                          child: Text(
                            scheduling.idHospitalNavigation!.endereco,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
