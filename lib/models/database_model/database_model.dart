import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:vacina_me/models/citizen_model/citizen_model.dart';
import 'package:vacina_me/models/database_model/credentials.dart';

class DatabaseModel extends ChangeNotifier {
  var settings = ConnectionSettings(
      host: HOST, port: PORT, user: USER, password: PASSWORD, db: DATABASE);

  Future<Results> read() async {
    var connection = await MySqlConnection.connect(settings);
    var results =
        await connection.query('select nome, cpf, idade from dados_cidadaos');

    for (var row in results) {
      print("Nome: ${row[0]}, CPF: ${row[1]}, Idade: ${row[2]}");
    }

    return results;
  }

  Future<String?> insert(CitizenModel citizen) async {
    try {
      var connection = await MySqlConnection.connect(settings);
      await connection.query(
          'insert into dados_cidadaos (nome, email, cpf, idade, grupo_prioritario, status_vacinacao, codigo_vacina) values (?, ?, ?, ?, ?, ?, ?)',
          [
            citizen.name,
            citizen.email,
            citizen.cpf,
            citizen.age,
            citizen.priorityGroupCode,
            citizen.vaccinationStatusCode,
            citizen.covidVaccineCode,
          ]);
      return "success";
    } on MySqlException catch (e) {
      print(e.toString());
      return e.errorNumber.toString();
    }
  }
}
