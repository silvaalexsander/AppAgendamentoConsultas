import 'package:agendamentohospitalar/models/login_api.dart';
import 'package:agendamentohospitalar/models/recipient_list.dart';
import 'package:agendamentohospitalar/utils/app_routes.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String cpf = Login.recipientMaster!.cpf;
  final _formKey = GlobalKey<FormState>();
  final _nameController =
      TextEditingController(text: Login.recipientMaster!.nome);
  final _enderecoController =
      TextEditingController(text: Login.recipientMaster!.endereco);
  final _telefoneController =
      TextEditingController(text: Login.recipientMaster!.telefone);

  bool edit = false;

  @override
  void initState() {
    super.initState();
    edit = false;
  }

  void _editProfile() {
    setState(() {
      edit = true;
    });
  }

  Future<void> _submit() async {
    final recipientList = RecipientList();
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    if (await recipientList.updateRecipient(
      Login.recipientMaster!.idBeneficiario,
      _nameController.text,
      Login.recipientMaster!.cpf,
      _telefoneController.text,
      _enderecoController.text,
      Login.recipientMaster!.numeroCarteirinha,
      Login.recipientMaster!.email,
      Login.recipientMaster!.senha,
    )) {
      setState(() {
        edit = false;
      });
      await Login.login(
          Login.recipientMaster!.email, Login.recipientMaster!.senha);
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Ocorreu um erro!'),
          content: const Text('Tente novamente mais tarde.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Fechar'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String cpfConf = Login.recipientMaster!.cpf;
    String cpfModificado =
        '${cpfConf.substring(0, 3)}.${cpfConf.substring(3, 6)}.${cpfConf.substring(6, 9)}-${cpfConf.substring(9, 11)}';
    String telefoneConf = Login.recipientMaster!.telefone;
    String telefoneModificado =
        '(${telefoneConf.substring(0, 2)}) ${telefoneConf.substring(2, 7)}-${telefoneConf.substring(7, 11)}';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados Pessoais'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  validator: ((value) {
                    if (value!.isEmpty || value.length < 5) {
                      return value.isEmpty
                          ? 'Campo obrigatório'
                          : 'Nome muito curto';
                    }
                    return null;
                  }),
                  enabled: edit,
                  // initialValue: Login.recipientMaster!.nome,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    labelText: 'Nome',
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    enabled: false,
                    initialValue: cpfModificado,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.numbers,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      labelText: edit ? 'CPF (Não editável)' : 'CPF',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _enderecoController,
                    enabled: edit,
                    // initialValue: Login.recipientMaster!.endereco,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 5) {
                        return value.isEmpty
                            ? 'Campo obrigatório'
                            : 'Endereço muito curto';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.business,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      labelText: 'Endereço',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _telefoneController,
                    enabled: edit,
                    // initialValue: telefoneModificado,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 11) {
                        return value.isEmpty
                            ? 'Campo obrigatório'
                            : 'Telefone muito curto';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.phone,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      labelText: 'Telefone',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    enabled: false,
                    initialValue: Login.recipientMaster!.numeroCarteirinha,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.credit_card,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      labelText: edit
                          ? 'Número da Carteirinha (Não editável)'
                          : 'Número da Carteirinha',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    enabled: false,
                    initialValue: Login.recipientMaster!.email,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      labelText: edit ? 'E-mail (Não editável)' : 'E-mail',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: !edit
                      ? ElevatedButton(
                          onPressed: () {
                            _editProfile();
                          },
                          child: const Text('Editar Dados'))
                      : ElevatedButton(
                          onPressed: () {
                            _submit();
                          },
                          child: const Text('Atualizar')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
