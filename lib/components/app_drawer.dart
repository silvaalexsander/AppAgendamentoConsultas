import 'package:agendamentohospitalar/pages/home_page.dart';
import 'package:agendamentohospitalar/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/login_api.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Bem vindo!'),
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
          // const Divider(),
          // Card(
          //   child: ListTile(
          //       leading: Icon(Icons.calendar_today,
          //           color: Theme.of(context).colorScheme.primary),
          //       title: const Text('Agendamentos'),
          //       onTap: () => Navigator.of(context)
          //           .popAndPushNamed(AppRoutes.listqueries)),
          // ),
          // const Divider(),
          // Card(
          //   child: ListTile(
          //     leading: Icon(Icons.paste_sharp,
          //         color: Theme.of(context).colorScheme.primary),
          //     title: const Text('Consultas Realizadas'),
          //     onTap: () {
          //       Navigator.of(context).popAndPushNamed(AppRoutes.test);
          //     },
          //   ),
          // ),
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
                var login = Provider.of<Login>(context, listen: false);
                login.logout();
                Navigator.of(context).popAndPushNamedls(AppRoutes.authpage);
              },
            ),
          ),
        ],
      ),
    );
  }
}
