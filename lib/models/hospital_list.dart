import 'package:agendamentohospitalar/data/hospitals_data.dart';
import 'package:flutter/widgets.dart';

import '../services/requests_http.dart';
import 'hospital.dart';

class HospitalList with ChangeNotifier {
  final List<Hospital> _items = []; //hospitalsData;
  List<Hospital> get items => [..._items];

  void add(Hospital hospital) {
    _items.add(hospital);
    notifyListeners();
  }

    getHospital(int idHospital) async {
    try {
      await fetchHospitals();

      final hospitalData = _items.firstWhere(
        (e) => e.idHospital == idHospital,
      );

      if (hospitalData != null) {
        return hospitalData;
      }

      return throw Exception('Especialidade não encontrada');

    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchHospitals() async {
    final hospitals = await RequestHttp.getHospitals();
    _items.addAll(hospitals);
    notifyListeners();
  }
}
