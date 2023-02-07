import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final specialtyList = Provider.of<SpecialtyList>(context);
    final recipientList = Provider.of<RecipientList>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste'),
      ),
       body: recipientList.items.isEmpty
          ? const Center(
              child: Text('Nenhuma especialidade cadastrada'),
            )
          : ListView.builder(
              itemCount: recipientList.items.length,
              itemBuilder: (ctx, i) => ListTile(
                title: Text(recipientList.items[i].nome),
              ),
            ),
      // FutureBuilder<List<Specialty>>(
      //   future: RequestHttp.getSpecialties(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return Text(snapshot.data![4].nome);
      //     } if (snapshot.hasError) {
      //       return Text('${snapshot.error}');
      //     }
      //     return const CircularProgressIndicator();
      //   },
      // ),
    );
  }
}
