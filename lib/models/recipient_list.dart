import 'package:agendamentohospitalar/data/recipients_data.dart';
import 'package:agendamentohospitalar/models/recipient.dart';
import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/cupertino.dart';

import '../services/requests_http.dart';

class RecipientList with ChangeNotifier, AsyncStateMixin {
  List<Recipient> _items = []; //recipientsData;
 
  List<Recipient> get items => [..._items];

  Future<bool> createRecipient(
    String nome,
    String cpf,
    String telefone,
    String endereco,
    String numeroCarteirinha,
    String email,
    String senha,
  ) async {
    final newRecipient = Recipient(
      idBeneficiario: 0,
      nome: nome,
      cpf: cpf,
      telefone: telefone,
      endereco: endereco,
      numeroCarteirinha: numeroCarteirinha,
      ativo: true,
      email: email,
      senha: senha,
    );
    if (await persisteRecipent(newRecipient)) {
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> persisteRecipent(Recipient recipient) async {
    _items.add(recipient);
    if (await RequestHttp.postRecipient(recipient)) {
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> updateRecipient(
    int idBeneficiario,
    String nome,
    String cpf,
    String telefone,
    String endereco,
    String numeroCarteirinha,
    String email,
    String senha,
  ) async {
    var newRecipient = Recipient(
      idBeneficiario: idBeneficiario,
      nome: nome,
      cpf: cpf,
      telefone: telefone,
      endereco: endereco,
      numeroCarteirinha: numeroCarteirinha,
      ativo: true,
      email: email,
      senha: senha,
    );
    if (await RequestHttp.patchRecipient(newRecipient)) {
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }


}
