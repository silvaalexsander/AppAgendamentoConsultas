import 'dart:convert';

import 'package:agendamentohospitalar/models/recipient.dart';
import 'package:agendamentohospitalar/models/recipient_list.dart';
import 'package:http/http.dart' as http;

class Login {


   static Future<Recipient> getRecipient(String email, String password, String token) async {
    var url = 'https://192.168.3.16:7026/email/$email/senha/$password';
    var header = {'Content-Type': 'application/json', 'Authorization': token};
    var response = await http.get(Uri.parse(url), headers: header);
    Map<String, dynamic> mapResponse = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Recipient recipient = Recipient.fromJson(mapResponse);
      return recipient;
    }
    throw Exception(response.statusCode);
  }

  static Future<bool> login(String email, String password) async {
    var url = 'https://192.168.3.16:7026/api/t';
    var header = {'Content-Type': 'application/json'};

    Map data = {
      'email': email,
      'senha': password,
    };

    var body = json.encode(data);

    var response = await http.post(Uri.parse(url), headers: header, body: body);
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map mapResponse = json.decode(response.body);
      String token = mapResponse['token'];
      await getRecipient(email, password, token);
      return true;
    } else {
      return false;
    }
  }
}
