import 'package:agendamentohospitalar/data/specialty_data.dart';
import 'package:flutter/widgets.dart';

import '../services/requests_http.dart';
import 'specialty.dart';

class SpecialtyList with ChangeNotifier {
  final List<Specialty> _items = []; //specialtyData;
  List<Specialty> get items => [..._items];

  void add(Specialty specialty) {
    _items.add(specialty);
    notifyListeners();
  }

  getSpecialty(int idEspecialidade) async {
    try {
      await fetchSpecialties();

      final specialtyData = _items.firstWhere(
        (e) => e.idEspecialidade == idEspecialidade,
      );

      if (specialtyData != null) {
        return specialtyData;
      }

      return throw Exception('Especialidade não encontrada');

    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchSpecialties() async {
    final specialties = await RequestHttp.getSpecialties();
    _items.addAll(specialties);
    notifyListeners();
  }
}
