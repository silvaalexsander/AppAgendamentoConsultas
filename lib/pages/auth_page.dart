import 'package:agendamentohospitalar/components/auth_form.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0, 77, 141, 1),
                Color.fromRGBO(33, 150, 243, 1)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Color.fromRGBO(0, 77, 141, 1),
                    ),
                  ),
                  AuthForm(),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
