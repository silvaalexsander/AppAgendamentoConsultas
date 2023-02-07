import 'package:agendamentohospitalar/models/hospital_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/drop_down_button.dart';

class QueryPage extends StatelessWidget {
  const QueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hospitalList = Provider.of<HospitalList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.topLeft,
          child: const Text('Agendamento de Consulta'),
        ),
      ),
      body: const DrowpDownButton(),
    );
  }
}
