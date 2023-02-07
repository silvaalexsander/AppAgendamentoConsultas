import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/scheduling_list.dart';
import '../utils/app_routes.dart';

class ConfirmModalButton extends StatelessWidget {
  final int idSpecialty;
  final int idProfissional;
  final int idHospital;
  final String hospital;
  final String specialty;
  final String professional;
  final DateTime date;
  final String time;
  const ConfirmModalButton(
      this.idSpecialty,
      this.idProfissional,
      this.idHospital,
      this.hospital,
      this.professional,
      this.specialty,
      this.date,
      this.time,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final schedulingList = Provider.of<ScheduligList>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('Confirmar Consulta',
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold)),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 9),
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
                      specialty,
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
            padding:
                const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 9),
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
                      professional,
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
            padding:
                const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 9),
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
                          DateFormat('EEEE dd/MM/yy', 'pt-br').format(date),
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_alarm,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              Text(
                                time,
                                style: const TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 9),
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
                      hospital,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  schedulingList.verifyScheduling(
                      idSpecialty, idProfissional, idHospital, time, date);
                  Navigator.of(context).pushReplacementNamed(AppRoutes.home);
                },
                child: const Text('Confirmar')),
          ),
        ],
      ),
    );
  }
}
