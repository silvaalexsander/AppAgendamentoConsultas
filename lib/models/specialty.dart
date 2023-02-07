class Specialty {
  final int idEspecialidade;
  final String nome;
  final String descricao;
  bool ativo;

  Specialty({
    required this.idEspecialidade,
    required this.nome,
    required this.descricao,
    this.ativo = true,
  });

  factory Specialty.fromJson(Map<String, dynamic> json) {
    return Specialty(
      idEspecialidade: json['idEspecialidade'],
      nome: json['nome'],
      descricao: json['descricao'],
      ativo: json['ativo'],
    );
  }
}
