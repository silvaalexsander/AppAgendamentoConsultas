import 'package:agendamentohospitalar/models/scheduling.dart';

class Recipient {
  final int idBeneficiario;
  final String nome;
  final String cpf;
  final String email;
  final String endereco;
  final String telefone;
  final String numeroCarteirinha;
  final String senha;
  List<Scheduling> agendamentos = [];
  bool ativo;

  Recipient({
    required this.idBeneficiario,
    required this.nome,
    required this.cpf,
    required this.email,
    required this.endereco,
    required this.telefone,
    required this.numeroCarteirinha,
    required this.senha,
    this.ativo = true,
    this.agendamentos = const [],
  });

  factory Recipient.fromJson(Map<String, dynamic> json) {
    return Recipient(
      idBeneficiario: json['idBeneficiario'],
      nome: json['nome'],
      cpf: json['cpf'],
      email: json['email'],
      endereco: json['endereco'],
      telefone: json['telefone'],
      numeroCarteirinha: json['numeroCarteirinha'],
      senha: json['senha'],
      ativo: json['ativo'],
      agendamentos: List<Scheduling>.from(
        json['agendamentos'].map(
          (x) => Scheduling.fromJson(x),
        ),
      ),
    );
  }

}
