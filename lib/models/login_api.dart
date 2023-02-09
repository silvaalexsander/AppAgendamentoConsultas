import 'dart:convert';

import 'package:agendamentohospitalar/models/recipient.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Login with ChangeNotifier {
  static String? token;
  static String? expireTo;
  static Recipient? recipientMaster;
  

  static Future<bool> login(String email, String password) async {
    String baseUrl = 'https://192.168.3.16:7026';
    var url = '$baseUrl/api/t';
    var header = {'Content-Type': 'application/json'};

    Map data = {
      'email': email,
      'senha': password,
    };

    var body = json.encode(data);

    var response = await http.post(Uri.parse(url), headers: header, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map mapResponse = json.decode(response.body);
      token = mapResponse['token'];
      expireTo = mapResponse['expiration'];
      var recipient = mapResponse['beneficario'];
      recipientMaster = Recipient(
        idBeneficiario: recipient['idBeneficiario'],
        nome: recipient['nome'],
        cpf: recipient['cpf'],
        telefone: recipient['telefone'],
        endereco: recipient['endereco'],
        numeroCarteirinha: recipient['numeroCarteirinha'],
        ativo: recipient['ativo'],
        email: recipient['email'],
        senha: recipient['senha'],
      );
      return true;
    } else {
      return false;
    }
  }

  void logout(){
    token = null;
    expireTo = null;
    recipientMaster = null;
    notifyListeners();
  }
}
