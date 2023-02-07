import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

class ModalButton extends StatelessWidget {
  const ModalButton({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        height: 80,
        alignment: Alignment.center,
        child: const Text(
          'Nova Consulta',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).popAndPushNamed(AppRoutes.newquery);
      },
    );
  }
}
