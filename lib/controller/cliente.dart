import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mssql_connection/mssql_connection.dart';

class ClienteController {
  ClienteController();

  Future<bool> login(String usuario, String senha) async {
    // Cria instância da conexão
    MssqlConnection mssqlConnection = MssqlConnection.getInstance();

    try {
      // Conecta ao banco
      bool isConnected = await mssqlConnection.connect(
        ip: dotenv.env["IP"] ?? "",
        port: dotenv.env["PORT"] ?? "",
        databaseName: dotenv.env["DATABASE"] ?? "",
        username: dotenv.env["USERNAME"] ?? "",
        password: dotenv.env["PASSWORD"] ?? "",
        timeoutInSeconds: dotenv.getInt("TIMEOUTSECONDS"),
      );

      if (isConnected) {
        // Consulta SQL
        String query = 'SELECT * FROM usuarios';
        final result = await mssqlConnection.getData(query);

        List<dynamic> userList = jsonDecode(result);

        // Itera e valida as credenciais
        for (var user in userList) {
          if (user["NomeUsuario"] == usuario && user["Senha"] == senha) {
            return true; // Credenciais válidas
          }
        }
      }
    } catch (e) {
      throw Exception("Erro ao conectar: $e");
    } finally {
      // Desconecta do banco
      mssqlConnection.disconnect();
    }

    return false; // Credenciais inválidas
  }

  bool logoff() {
    return true;
  }
}
