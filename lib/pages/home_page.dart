import 'package:agendamentohospitalar/components/query_scheduling.dart';
import 'package:agendamentohospitalar/models/scheduling_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/app_drawer.dart';
import '../models/modal.dart';
import '../models/recipient_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final schedulinglist = Provider.of<ScheduligList>(context);
    final recipientlist = Provider.of<RecipientList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.topLeft,
          child: const Text('Bem vindo'),
        ),
      ),
      body: schedulinglist.items.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Text(
                    'Olá ${recipientlist.items.length} você não tem consultas agendadas',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: FittedBox(
                    child: Image.network(
                        'https://cdn.pixabay.com/photo/2016/07/25/14/42/close-1540630_960_720.png'),
                  ),
                ),
              ],
            )
          : const SingleChildScrollView(
              child: QueryScheduling(),
            ),
      drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modal.mainBottomSheet(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
