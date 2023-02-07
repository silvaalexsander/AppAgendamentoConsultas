import 'package:agendamentohospitalar/models/profissional.dart';
import 'package:agendamentohospitalar/models/recipient.dart';
import 'package:agendamentohospitalar/models/specialty.dart';
import 'package:intl/intl.dart';

import 'hospital.dart';

class Scheduling {
  int idAgendamento;
  int idHospital;
  int idEspecialidade;
  int idProfissional;
  DateTime dataHoraAgendamento;
  int idBeneficiario;
  bool ativo;
  String? horario;
  Recipient? idBeneficiarioNavigation;
  Specialty? idEspecialidadeNavigation;
  Profissional? idProfissionalNavigation;
  Hospital? idHospitalNavigation;

  Scheduling({
    required this.idAgendamento,
    required this.idHospital,
    required this.idEspecialidade,
    required this.idProfissional,
    required this.dataHoraAgendamento,
    required this.idBeneficiario,
    required this.ativo,
    this.horario,
    this.idBeneficiarioNavigation,
    this.idEspecialidadeNavigation,
    this.idProfissionalNavigation,
    this.idHospitalNavigation,
  });

  factory Scheduling.fromJson(Map<String, dynamic> json) {
    var formatter = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    DateTime dataHoraAgendamento = formatter.parse(json['dataHoraAgendamento']);
    return Scheduling(
        idAgendamento: json['idAgendamento'],
        idHospital: json['idHospital'],
        idEspecialidade: json['idEspecialidade'],
        idProfissional: json['idProfissional'],
        dataHoraAgendamento: dataHoraAgendamento,
        idBeneficiario: json['idBeneficiario'],
        ativo: json['ativo'] == 1 ? true : false);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idAgendamento'] = this.idAgendamento;
    data['idHospital'] = this.idHospital;
    data['idEspecialidade'] = this.idEspecialidade;
    data['idProfissional'] = this.idProfissional;
    data['dataHoraAgendamento'] = this.dataHoraAgendamento.toIso8601String();
    data['idBeneficiario'] = this.idBeneficiario;
    data['ativo'] = this.ativo ? 1 : 0;
    return data;
  }
}


// class Scheduling {
//    int idAgendamento;
//    int idHospital;
//    int idEspecialidade;
//    int idProfissional;
//    int idBeneficiario;
//    DateTime DataHoraAgendamento;
//    bool ativo;
//    String? horario;
//    Recipient? idBeneficiarioNavigation;
//    Specialty? idEspecialidadeNavigation;
//    Profissional? idProfissionalNavigation;
//    Hospital? idHospitalNavigation;

//   Scheduling(
//     this.horario,
//      this.idBeneficiarioNavigation,
//      this.idEspecialidadeNavigation,
//      this.idProfissionalNavigation,
//      this.idHospitalNavigation,
//    { required this.idAgendamento,
//     required this.idHospital,
//     required this.idEspecialidade,
//     required this.idProfissional,
//     required this.idBeneficiario,
//     required this.ativo,
//     required this.DataHoraAgendamento}
    
//   );

//   factory Scheduling.fromJson(Map<String, dynamic> json) {
//     final dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
//     return Scheduling(
//       idAgendamento: json['idAgendamento'],
//       idHospital: json['idHospital'],
//       idEspecialidade: json['idEspecialidade'],
//       idProfissional: json['idProfissional'],
//       idBeneficiario: json['idBeneficiario'],
//       ativo: json['ativo'],
//       DataHoraAgendamento: dateFormat.parse(json['DataHoraAgendamento']),

      
//       // DataHoraAgendamento: DateTime.parse(json['DataHoraAgendamento']),
//       // horario: json['horario'],
//       // idBeneficiarioNavigation: Recipient.fromJson(json['idBeneficiarioNavigation']),
//       // idEspecialidadeNavigation: Specialty.fromJson(json['idEspecialidadeNavigation']),
//       // idProfissionalNavigation: Profissional.fromJson(json['idProfissionalNavigation']),
//       // idHospitalNavigation: Hospital.fromJson(json['idHospialNavigation']),
//     );
//   }
// }
