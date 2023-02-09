import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: Container(
        child: Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Perfil'),
                onTap: () => Navigator.pushNamed(context, '/profile'),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.lock),
                title: Text('Alterar senha'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
