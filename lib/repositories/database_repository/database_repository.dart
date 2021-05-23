import 'package:mysql1/mysql1.dart';
import 'package:vacina_me/repositories/database_repository/credentials.dart';

class DatabaseRepository {
  var settings = ConnectionSettings(
      host: HOST, port: PORT, user: USER, password: PASSWORD, db: DATABASE);

  Future<MySqlConnection> connection() async {
    return await MySqlConnection.connect(settings);
  }
}
