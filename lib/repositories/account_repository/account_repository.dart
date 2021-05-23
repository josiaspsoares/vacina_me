import 'package:mysql1/mysql1.dart';
import 'package:vacina_me/models/user_model/user_model.dart';
import 'package:vacina_me/repositories/database_repository/database_repository.dart';
import 'package:vacina_me/viewmodel/signup_viewmodel/signup_viewmodel.dart';
import 'package:vacina_me/viewmodel/vaccination_data_search_viewmodel/vaccination_data_search_viewmodel.dart';

class AccountRepository {
  Future<String?> createAccount(SignupViewModel model) async {
    try {
      var connection = await DatabaseRepository().connection();
      await connection.query(
          'insert into dados_cidadaos (nome, email, cpf, idade, grupo_prioritario, status_vacinacao, codigo_vacina) values (?, ?, ?, ?, ?, ?, ?)',
          [
            model.name,
            model.email,
            model.cpf,
            int.parse(model.age),
            int.parse(model.priorityGroupCode),
            0,
            0,
          ]);
      return "success";
    } on MySqlException catch (e) {
      print(e.toString());
      return e.errorNumber.toString();
    }
  }

  Future<UserModel?> readAccountData(
      VaccinationDataSearchViewModel model) async {
    try {
      var connection = await DatabaseRepository().connection();
      var results = await connection.query(
          'select nome, email, cpf, idade, grupo_prioritario, status_vacinacao, codigo_vacina from dados_cidadaos where cpf = (?) and email = (?)',
          [
            model.cpf,
            model.email,
          ]);

      for (var row in results) {
        print("Nome: ${row[0]}, CPF: ${row[1]}, Idade: ${row[2]}");
        return UserModel(
          name: row[0],
          email: row[1],
          cpf: row[2],
          age: row[3],
          priorityGroupCode: row[4],
          vaccinationStatusCode: row[5],
          covidVaccineCode: row[6],
        );
      }
    } on MySqlException catch (e) {
      print(e.toString());
    }
  }
}
