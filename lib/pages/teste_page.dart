import 'package:agendamentohospitalar/models/scheduling_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
    String query =
        'Av. Albert Einstein, 627/701 - Morumbi, São Paulo - SP, 05652-900';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final url =
                'https://www.google.com/maps/search/?api=1&query=$query';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Não foi possível abrir o Google Maps';
            }
          },
          child: const Text('Abrir Google Maps'),
        ),
      ),
    );
  }
}
