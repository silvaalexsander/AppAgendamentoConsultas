import 'package:agendamentohospitalar/utils/app_routes.dart';
import 'package:flutter/material.dart';

import '../models/login_api.dart';
import '../models/recipient_list.dart';

enum AuthMode { signup, login }

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _cpfController = TextEditingController();
  final _numCarteirinhaController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthMode _authMode = AuthMode.login;
  bool _isLogin() => _authMode == AuthMode.login;
  Login login = Login();

  void _switchAuthMode() {
    setState(() {
      if (_isLogin()) {
        _authMode = AuthMode.signup;
      } else {
        _authMode = AuthMode.login;
      }
    });
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    if (await Login.login(_emailController.text, _passwordController.text)) {
      await Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Usuario ou senha incorretos!'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  Future<void> _submitRegister() async {
    final recipientList = RecipientList();
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    if (await recipientList.createRecipient(
      _nameController.text,
      _cpfController.text,
      _telefoneController.text,
      _enderecoController.text,
      _numCarteirinhaController.text,
      _emailController.text,
      _passwordController.text,
    )) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.authpage);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Falha ao cadastrar!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        width: deviceWidth * 0.90,
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (!_isLogin())
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      labelText: 'Nome',
                      labelStyle: const TextStyle(fontSize: 18),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 10) {
                      return value.isEmpty? 'Informe um nome válido!' : 'Nome precisa ter no mínimo 10 caracteres!';
                    }
                    return null;
                  },
                ),
              if (!_isLogin())
                TextFormField(
                  controller: _cpfController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'CPF',
                      labelStyle: const TextStyle(fontSize: 18),
                      prefixIcon: Icon(
                        Icons.key_sharp,
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                  validator: (value) {
                    if (value!.isEmpty || value.trim().length < 11) {
                      return value.isEmpty? 'Informe um CPF válido!' : 'CPF precisa ter 11 caracteres!';
                    }
                    return null;
                  },
                ),
              if (!_isLogin())
                TextFormField(
                  controller: _numCarteirinhaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Número da Carteirinha',
                      labelStyle: const TextStyle(fontSize: 18),
                      prefixIcon: Icon(
                        Icons.credit_card_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe um número de carteirinha válido!';
                    }
                    return null;
                  },
                ),
              if (!_isLogin())
                TextFormField(
                  controller: _telefoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Telefone',
                      labelStyle: const TextStyle(fontSize: 18),
                      prefixIcon: Icon(
                        Icons.phone_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                  validator: (value) {
                    if (value!.isEmpty || value.trim().length < 11) {
                      return value.isEmpty? 'Informe um número válido!' : 'Número precisa ter 11 caracteres!';
                    }
                    return null;
                  },
                ),
              if (!_isLogin())
                TextFormField(
                  controller: _enderecoController,
                  decoration: InputDecoration(
                      labelText: 'Endereço',
                      labelStyle: const TextStyle(fontSize: 18),
                      prefixIcon: Icon(
                        Icons.home_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return 'Informe um endereço válido!';
                    }
                    return null;
                  },
                ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: const TextStyle(fontSize: 18),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                    )),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Informe um e-mail válido!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: const TextStyle(fontSize: 18),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Theme.of(context).colorScheme.secondary,
                    )),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty || value.length < 5) {
                    return value.isEmpty ? 'Informe uma senha válida!' : 'Senha precisa ter no mínimo 5 caracteres!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              if (!_isLogin())
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                      labelText: 'Confirmar Senha',
                      labelStyle: const TextStyle(fontSize: 18),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty || value != _passwordController.text) {
                      return value.isEmpty? 'Informe uma senha válida!' : 'Senhas não conferem!';
                    }
                    return null;
                  },
                ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: deviceWidth * 0.13,
                width: deviceWidth * 0.35,
                child: ElevatedButton(
                  onPressed: () {
                    // _submit();
                    setState(() {
                    });
                    _isLogin() ? _submit() : _submitRegister();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(_isLogin() ? 'Entrar' : 'Cadastrar',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Ainda não tem conta?'),
                  TextButton(
                    onPressed: () {
                      _switchAuthMode();
                    },
                    child: Text(
                      _isLogin() ? 'Cadastre-se' : 'Já tenho conta',
                      style: const TextStyle(
                        color: Color.fromRGBO(33, 150, 243, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
