import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/scheduling_list.dart';

class ListQuery extends StatelessWidget {
  const ListQuery({super.key});

  @override
  Widget build(BuildContext context) {
    final schedulingList = Provider.of<ScheduligList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendamentos'),
      ),
      body: ListView.builder(
        itemCount: schedulingList.items.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(6.0),
          child: Card(
            elevation: 5,
            child: ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('dd').format(
                        schedulingList.items[index].dataHoraAgendamento),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20),
                  ),
                  Text(
                    DateFormat('MMM').format(
                        schedulingList.items[index].dataHoraAgendamento),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 14),
                  ),
                ],
              ),
              title: Text(
                schedulingList.items[index].idEspecialidadeNavigation!.nome,
              ),
              subtitle: Text(
                schedulingList.items[index].idProfissionalNavigation!.nome,
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
              trailing: Text(
                schedulingList.items[index].horario.toString(),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold),
              ),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
          ),
        ),
      ),
    );
  }
}
