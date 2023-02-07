import 'package:agendamentohospitalar/models/scheduling.dart';

class Profissional {
  final int idProfissional;
  final String nome;
  final String endereco;
  final String telefone;
  bool ativo;
  List<Scheduling>? agendamentos;
  //final List<String> horarios;

  Profissional({
    //required this.horarios,
    required this.idProfissional,
    required this.nome,
    required this.endereco,
    required this.telefone,
    this.agendamentos,
    this.ativo = true,
  });

  factory Profissional.fromJson(Map<String, dynamic> json) {
    return Profissional(
      idProfissional: json['idProfissional'],
      nome: json['nome'],
      endereco: json['endereco'],
      telefone: json['telefone'],
      ativo: json['ativo'],
    );
  }
}
