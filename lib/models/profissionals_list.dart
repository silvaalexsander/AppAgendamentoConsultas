import 'package:flutter/widgets.dart';
import '../services/requests_http.dart';
import 'profissional.dart';

class ProfissionalList with ChangeNotifier {
  final List<Profissional> _items = []; //profissionalsData;
  List<Profissional> get items => [..._items];

  void add(Profissional profissional) {
    _items.add(profissional);
    notifyListeners();
  }

  getProfissional(int idProfissional) async {
    try {
      await fetchProfissionals();

      final profissionalData = _items.firstWhere(
        (e) => e.idProfissional == idProfissional,
      );

      if (profissionalData != null) {
        return profissionalData;
      }

      return throw Exception('Especialidade não encontrada');

    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchProfissionals() async {
    final profissionals = await RequestHttp.getProfessionals();
    _items.addAll(profissionals);
    notifyListeners();
  }
}
