import 'package:agendamentohospitalar/models/scheduling.dart';
import 'package:agendamentohospitalar/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/scheduling_list.dart';

class QueryScheduling extends StatelessWidget {
  const QueryScheduling({super.key});

  @override
  Widget build(BuildContext context) {
    final schedulinglist = Provider.of<ScheduligList>(context);

    Future<void> cancelQuery(Scheduling scheduling) async {
      Future.delayed(const Duration(seconds: 0), () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Cancelar Consulta'),
            content: const Text('Deseja realmente cancelar esta consulta?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Não'),
              ),
              TextButton(
                onPressed: () {
                  const CircularProgressIndicator();
                  schedulinglist.remove(scheduling.idAgendamento);
                  Navigator.of(context).pushReplacementNamed(AppRoutes.home);
                },
                child: const Text('Sim'),
              ),
            ],
          ),
        );
      });
    }

    void editQuery(Scheduling scheduling) {
      Future.delayed(const Duration(seconds: 0), () {
        Navigator.pushNamed(
          context,
          AppRoutes.newquery,
          arguments: scheduling,
        );
      });
    }

    return Column(
      children: schedulinglist.items.map((scheduling) {
        return Container(
          margin:
              const EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 20),
          height: 200,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 40.0),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.querydetails,
                          arguments: scheduling,
                        );
                      },
                      child: Card(
                        elevation: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child:
                                    scheduling.idEspecialidadeNavigation == null
                                        ? const Text('-')
                                        : Text(
                                            scheduling
                                                .idEspecialidadeNavigation!
                                                .nome,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                          ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 85),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Icon(
                                        Icons.medical_information,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      ),
                                      title:
                                          scheduling.idProfissionalNavigation ==
                                                  null
                                              ? const Text('-')
                                              : Text(scheduling
                                                  .idProfissionalNavigation!
                                                  .nome),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.local_hospital_outlined,
                                        color:
                                            Theme.of(context).colorScheme.error,
                                      ),
                                      title: scheduling.idHospitalNavigation ==
                                              null
                                          ? const Text('-')
                                          : Text(scheduling
                                              .idHospitalNavigation!.nome),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                            child: Text(
                                              'Editar',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onTap: () {
                                              editQuery(scheduling);
                                            }),
                                        const Divider(),
                                        GestureDetector(
                                            child: Text(
                                              'Cancelar',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .error,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onTap: () {
                                              cancelQuery(scheduling);
                                            }),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30.0),
                    alignment: FractionalOffset.centerLeft,
                    child: Container(
                      alignment: FractionalOffset.center,
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(270)),
                        color: Theme.of(context).colorScheme.primary,
                        border: Border(
                          top: BorderSide(
                              width: 4.0,
                              color: Theme.of(context).colorScheme.primary),
                          left: BorderSide(
                              width: 4.0,
                              color: Theme.of(context).colorScheme.primary),
                          right: BorderSide(
                              width: 4.0,
                              color: Theme.of(context).colorScheme.primary),
                          bottom: BorderSide(
                              width: 4.0,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('dd')
                                .format(scheduling.dataHoraAgendamento),
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                              DateFormat.MMMM("pt_BR")
                                  .format(scheduling.dataHoraAgendamento),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  color: Colors.white,
                                ),
                                Text(
                                  DateFormat('HH:mm')
                                      .format(scheduling.dataHoraAgendamento),
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
