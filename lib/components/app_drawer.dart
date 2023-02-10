import 'package:agendamentohospitalar/pages/home_page.dart';
import 'package:agendamentohospitalar/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/login_api.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer() : super(key: const Key('AppDrawer'));

  Future<void> _showExitDialog(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Saindo...'),
              content: const Text('Deseja realmente sair?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Não'),
                ),
                TextButton(
                  onPressed: () {
                    Provider.of<Login>(context, listen: false).logout();
                    Navigator.of(context).pop();
                    Navigator.of(context).popAndPushNamed(AppRoutes.authpage);
                  },
                  child: const Text('Sim'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Opções'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          Card(
            child: ListTile(
                leading: Icon(Icons.add_circle_outline,
                    color: Theme.of(context).colorScheme.primary),
                title: const Text('Agendar Consulta'),
                onTap: () =>
                    Navigator.of(context).popAndPushNamed(AppRoutes.newquery)),
          ),
          const Divider(),
          Card(
            child: ListTile(
              leading: Icon(Icons.settings,
                  color: Theme.of(context).colorScheme.primary),
              title: const Text('Configurações'),
              onTap: () {
                Navigator.of(context).popAndPushNamed(AppRoutes.settings);
              },
            ),
          ),
          const Divider(),
          Card(
            child: ListTile(
              leading: Icon(Icons.exit_to_app,
                  color: Theme.of(context).colorScheme.primary),
              title: const Text('Sair'),
              onTap: () {
                _showExitDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
