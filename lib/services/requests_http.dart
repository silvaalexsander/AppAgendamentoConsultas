import 'dart:convert';
import 'package:agendamentohospitalar/models/recipient.dart';
import 'package:agendamentohospitalar/models/scheduling.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../models/hospital.dart';
import '../models/profissional.dart';
import '../models/specialty.dart';

class RequestHttp {
  static String baseUrl = 'https://192.168.3.16:7026/api';

  //Get lista de Especialidades
  static Future<List<Specialty>> getSpecialties() async {
    try {
      var response = await http.get(Uri.parse('$baseUrl/Especialidade'));
      if (response.statusCode == 200) {
        var specialties = <Specialty>[];
        var specialtiesJson = json.decode(response.body) as List;
        for (var specialtyJson in specialtiesJson) {
          specialties.add(Specialty.fromJson(specialtyJson));
        }
        return specialties;
      } else {
        throw Exception(
            'Failed to load specialties, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load specialties, error: $e');
    }
  }

  //Get lista de Hospitais
  static Future<List<Hospital>> getHospitals() async {
    var hospitals = <Hospital>[];
    try {
      var response = await http.get(Uri.parse('$baseUrl/Hospital'));
      if (response.statusCode == 200) {
        var hospitalsJson = json.decode(response.body) as List;
        for (var hospitalJson in hospitalsJson) {
          hospitals.add(Hospital.fromJson(hospitalJson));
        }
        return hospitals;
      } else {
        throw Exception('Failed to load hospitals');
      }
    } catch (e) {
      throw Exception('Failed to load hospitals: $e');
    }
  }

  //Get lista de Profissionais
  static Future<List<Profissional>> getProfessionals() async {
    var professionals = <Profissional>[];
    try {
      var response = await http.get(Uri.parse('$baseUrl/Profissional'));
      if (response.statusCode == 200) {
        var professionalsJson = json.decode(response.body) as List;
        for (var professionalJson in professionalsJson) {
          professionals.add(Profissional.fromJson(professionalJson));
        }
        return professionals;
      } else {
        throw Exception('Failed to load professionals');
      }
    } catch (e) {
      throw Exception('Failed to load professionals: $e');
    }
  }

  //Get de Agendamento por ID do Beneficiario
  static Future<List<Scheduling>> getScheduling(int idBeneficiario) async {
    var url = '$baseUrl/Agendamento/$idBeneficiario';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var scheduling = <Scheduling>[];
      var schedulingJson = json.decode(response.body) as List;
      for (var schedulingJson in schedulingJson) {
        scheduling.add(Scheduling.fromJson(schedulingJson));
      }
      return scheduling;
    } else {
      throw Exception('Failed to load scheduling');
    }
  }

  //Post de Agendamento
  static Future<bool> postScheduling(Scheduling scheduling) async {
    var header = {'Content-Type': 'application/json'};
    var formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    Map data = {
      'idHospital': scheduling.idHospital,
      'idEspecialidade': scheduling.idEspecialidade,
      'idProfissional': scheduling.idProfissional,
      'idBeneficiario': scheduling.idBeneficiario,
      'DataHoraAgendamento': formatter.format(scheduling.dataHoraAgendamento),
      'ativo': scheduling.ativo,
    };

    var body = json.encode(data);

    final response = await http.post(
      Uri.parse('$baseUrl/Agendamento'),
      headers: header,
      body: body,
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to create scheduling.');
    }
  }

  //Delete de Agendamento
  static Future<bool> deleteScheduling(int idAgendamento) async {
    var url = '$baseUrl/Agendamento/$idAgendamento';
    var response = await http.delete(Uri.parse(url));
    if (response.statusCode == 200) {
      return await true;
    } else {
      throw Exception('Failed to delete scheduling');
    }
  }

  //Patch de Agendamento
  static Future<bool> patchScheduling(Scheduling scheduling) async {
    var header = {'Content-Type': 'application/json'};
    var formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    Map data = {
      'idHospital': scheduling.idHospital,
      'idEspecialidade': scheduling.idEspecialidade,
      'idProfissional': scheduling.idProfissional,
      'idBeneficiario': scheduling.idBeneficiario,
      'DataHoraAgendamento': formatter.format(scheduling.dataHoraAgendamento),
      'ativo': scheduling.ativo,
    };

    var body = json.encode(data);

    var url = '$baseUrl/Agendamento/${scheduling.idAgendamento}';
    var response =
        await http.patch(Uri.parse(url), headers: header, body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to update scheduling');
    }
  }

  //Post de Beneficiario
  static Future<bool> postRecipient(Recipient recipient) async {
    var header = {'Content-Type': 'application/json'};

    Map data = {
      'nome': recipient.nome,
      'cpf': recipient.cpf,
      'telefone': recipient.telefone,
      'endereco': recipient.endereco,
      'numeroCarteirinha': recipient.numeroCarteirinha,
      'ativo': recipient.ativo,
      'email': recipient.email,
      'senha': recipient.senha,
    };

    var body = json.encode(data);

    final response = await http.post(
      Uri.parse('$baseUrl/Beneficiario'),
      headers: header,
      body: body,
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to create recipient.');
    }
  }

  //Get de Beneficiario
  static Future<Recipient> getRecipient(
      String email, String password, String token) async {
    var url = 'https://192.168.3.16:7026/email/$email/senha/$password';
    var header = {'Content-Type': 'application/json', 'Authorization': token};
    var response = await http.get(Uri.parse(url), headers: header);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      Recipient recipient = Recipient.fromJson(mapResponse);
      return recipient;
    } else {
      throw Exception('Failed to load recipient');
    }
  }

  //Patch de Beneficiario
  static Future<bool> patchRecipient(Recipient recipient) async {
    var header = {'Content-Type': 'application/json'};

    Map data = {
      'nome': recipient.nome,
      'cpf': recipient.cpf,
      'telefone': recipient.telefone,
      'endereco': recipient.endereco,
      'numeroCarteirinha': recipient.numeroCarteirinha,
      'ativo': recipient.ativo,
      'email': recipient.email,
      'senha': recipient.senha,
    };

    var body = json.encode(data);

    var url = '$baseUrl/Beneficiario/${recipient.idBeneficiario}';
    print('$baseUrl/Beneficiario/${recipient.idBeneficiario}');
    var response =
        await http.patch(Uri.parse(url), headers: header, body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to update recipient');
    }
  }
}
