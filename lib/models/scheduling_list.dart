import 'dart:math';
import 'package:agendamentohospitalar/models/profissional.dart';
import 'package:agendamentohospitalar/models/profissionals_list.dart';
import 'package:agendamentohospitalar/models/scheduling.dart';
import 'package:agendamentohospitalar/models/specialty.dart';
import 'package:agendamentohospitalar/models/specialty_list.dart';
import 'package:agendamentohospitalar/services/requests_http.dart';
import 'package:flutter/widgets.dart';
import 'hospital.dart';
import 'hospital_list.dart';
import 'login_api.dart';

class ScheduligList with ChangeNotifier {
  final List<Scheduling> _items = []; //schedlingData;
  List<Scheduling> get items => [..._items];
  final ProfissionalList _profissionalList = ProfissionalList();
  final SpecialtyList _specialtyList = SpecialtyList();
  final HospitalList _hospitalList = HospitalList();
  Hospital? hospital;
  Profissional? profissional;
  Specialty? specialty;
  bool isLoading = false;

  void ordena() {
    _items
        .sort((a, b) => a.dataHoraAgendamento.compareTo(b.dataHoraAgendamento));
  }

  Future<void> alterState() async {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> verifyScheduling(
    int idEspecialidade,
    int idProfissional,
    int idHospital,
    String horarioMarcado,
    DateTime diaMarcado,
  ) async {
    String data = diaMarcado.toString().substring(0, 10);
    data = ('$data' 'T$horarioMarcado.000');
    diaMarcado = DateTime.parse(data);
    await alterState();
    await add(Scheduling(
      idAgendamento: Random().nextInt(1000),
      idHospital: idHospital,
      idEspecialidade: idEspecialidade,
      idProfissional: idProfissional,
      idBeneficiario: Login.recipientMaster!.idBeneficiario,
      ativo: true,
      dataHoraAgendamento: diaMarcado,
      horario: horarioMarcado,
      idBeneficiarioNavigation: Login.recipientMaster,
      idEspecialidadeNavigation:
          await _specialtyList.getSpecialty(idEspecialidade),
      idProfissionalNavigation:
          await _profissionalList.getProfissional(idProfissional),
      idHospitalNavigation: await _hospitalList.getHospital(idHospital),
    ));
    await alterState();
    notifyListeners();
  }

  Future<void> add(Scheduling scheduling) async {
    RequestHttp.postScheduling(scheduling);

    // Adiciona o agendamento à lista
    _items.add(scheduling);

    // Ordena a lista utilizando o sort()
    _items
        .sort((a, b) => a.dataHoraAgendamento.compareTo(b.dataHoraAgendamento));

    notifyListeners();
  }

  Future<void> remove(int idAgendamento) async {
    await alterState();
    int index =
        _items.indexWhere((element) => element.idAgendamento == idAgendamento);
    if (index != -1) {
      await RequestHttp.deleteScheduling(idAgendamento);
      _items.removeAt(index);
      await alterState();
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
    String data = diaMarcado.toString().substring(0, 10);
    data = ('$data' 'T$horarioMarcado.000');
    diaMarcado = DateTime.parse(data);
    final index =
        _items.indexWhere((element) => element.idAgendamento == idAgendamento);

    if (index == -1) {
      return;
    }
    await alterState();
    Scheduling scheduling = Scheduling(
      idAgendamento: idAgendamento,
      idHospital: idHospital,
      idEspecialidade: idEspecialidade,
      idProfissional: idProfissional,
      idBeneficiario: Login.recipientMaster!.idBeneficiario,
      ativo: true,
      dataHoraAgendamento: diaMarcado,
      horario: horarioMarcado,
      idBeneficiarioNavigation: Login.recipientMaster,
      idEspecialidadeNavigation:
          await _specialtyList.getSpecialty(idEspecialidade),
      idProfissionalNavigation:
          await _profissionalList.getProfissional(idProfissional),
      idHospitalNavigation: await _hospitalList.getHospital(idHospital),
    );
    await RequestHttp.patchScheduling(scheduling);
    _items[index] = scheduling;
    await alterState();
    ordena();
    notifyListeners();
  }

  Future<void> loadScheduling() async {
    final List<Scheduling> loadedScheduling =
        await RequestHttp.getScheduling(Login.recipientMaster!.idBeneficiario);
    _items.clear();
    _items.addAll(loadedScheduling);
    ordena();
    notifyListeners();
  }
}
