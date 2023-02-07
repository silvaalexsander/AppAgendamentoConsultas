class Hospital {
  final int idHospital;
  final String nome;
  final String endereco;
  final String telefone;
  final String cnpj;
  final String cnes;
  bool ativo;

  Hospital({
    required this.idHospital,
    required this.nome,
    required this.endereco,
    required this.telefone,
    required this.cnpj,
    required this.cnes,
    this.ativo = true,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      idHospital: json['idHospital'],
      nome: json['nome'],
      endereco: json['endereco'],
      telefone: json['telefone'],
      cnpj: json['cnpj'],
      cnes: json['cnes'],
      ativo: json['ativo'],
    );
  }
}
