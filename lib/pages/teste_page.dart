import 'package:agendamentohospitalar/models/scheduling_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/login_api.dart';
import '../models/recipient_list.dart';
import '../models/specialty_list.dart';

class TestePage extends StatefulWidget {
  const TestePage({super.key});

  @override
  State<TestePage> createState() => _TestePageState();
}

class _TestePageState extends State<TestePage> {
  @override
  Widget build(BuildContext context) {
    final recipientList = Provider.of<RecipientList>(context);
    final scheduligList = Provider.of<ScheduligList>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste'),
      ),
      body: recipientList.items.isEmpty
          ? Center(
              child: Text(
                  scheduligList.items[0].idBeneficiarioNavigation!.nome),
            )
          : ListView.builder(
              itemCount: recipientList.items.length,
              itemBuilder: (ctx, i) => ListTile(
                title: Text(recipientList.items[i].nome),
              ),
            ),
    );
  }
}
