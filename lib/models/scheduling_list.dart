import 'dart:math';
import 'package:agendamentohospitalar/models/profissional.dart';
import 'package:agendamentohospitalar/models/profissionals_list.dart';
import 'package:agendamentohospitalar/models/recipient.dart';
import 'package:agendamentohospitalar/models/scheduling.dart';
import 'package:agendamentohospitalar/models/specialty.dart';
import 'package:agendamentohospitalar/models/specialty_list.dart';
import 'package:agendamentohospitalar/services/requests_http.dart';
import 'package:flutter/widgets.dart';
import 'hospital.dart';
import 'hospital_list.dart';

class ScheduligList with ChangeNotifier {
  final List<Scheduling> _items = []; //schedlingData;
  List<Scheduling> get items => [..._items];
  final ProfissionalList _profissionalList = ProfissionalList();
  final SpecialtyList _specialtyList = SpecialtyList();
  final HospitalList _hospitalList = HospitalList();
  Hospital? hospital;
  Profissional? profissional;
  Specialty? specialty;

  void ordena() {
    _items
        .sort((a, b) => a.dataHoraAgendamento.compareTo(b.dataHoraAgendamento));
  }

  Recipient recipient = Recipient(
    idBeneficiario: 1,
    nome: 'Alexsander',
    cpf: '2423251',
    email: 'alex@gmail.com',
    endereco: 'Rua 1',
    telefone: '123456789',
    numeroCarteirinha: '123456',
    senha: '123456',
  );

  Future<void> verifyScheduling(
    int idEspecialidade,
    int idProfissional,
    int idHospital,
    String horarioMarcado,
    DateTime diaMarcado,
  ) async {
    await add(Scheduling(
      idAgendamento: Random().nextInt(1000),
      idHospital: idHospital,
      idEspecialidade: idEspecialidade,
      idProfissional: idProfissional,
      idBeneficiario: recipient.idBeneficiario,
      ativo: true,
      dataHoraAgendamento: diaMarcado,
      horario: horarioMarcado,
      idBeneficiarioNavigation: recipient,
      idEspecialidadeNavigation:
          await _specialtyList.getSpecialty(idEspecialidade),
      idProfissionalNavigation:
          await _profissionalList.getProfissional(idProfissional),
      idHospitalNavigation: await _hospitalList.getHospital(idHospital),
    ));
    notifyListeners();
  }

  Future<void> add(Scheduling scheduling) async {
    RequestHttp.postScheduling(scheduling);

    // Adiciona o agendamento à lista
    _items.add(scheduling);

    // Ordena a lista utilizando o sort()
    _items.sort();

    notifyListeners();
  }

  Future<void> remove(int idAgendamento) async {
    int index =
        _items.indexWhere((element) => element.idAgendamento == idAgendamento);
    if (index != -1) {
      _items.removeAt(index);
      notifyListeners();
    }
  }

  Future<void> update(
    int idAgendamento,
    int idEspecialidade,
    int idProfissional,
    int idHospital,
    String horarioMarcado,
    DateTime diaMarcado,
  ) async {
    final index =
        _items.indexWhere((element) => element.idAgendamento == idAgendamento);

    if (index == -1) {
      return;
    }

    var scheduling = Scheduling(
      idAgendamento: idAgendamento,
      idHospital: idHospital,
      idEspecialidade: idEspecialidade,
      idProfissional: idProfissional,
      idBeneficiario: recipient.idBeneficiario,
      ativo: true,
      dataHoraAgendamento: diaMarcado,
      horario: horarioMarcado,
      idBeneficiarioNavigation: recipient,
      idEspecialidadeNavigation:
          await _specialtyList.getSpecialty(idEspecialidade),
      idProfissionalNavigation:
          await _profissionalList.getProfissional(idProfissional),
      idHospitalNavigation: await _hospitalList.getHospital(idHospital),
    );
    _items[index] = scheduling;
    ordena();
    notifyListeners();
  }
}
