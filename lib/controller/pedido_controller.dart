import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mssql_connection/mssql_connection.dart';

class PedidoController {
  void fetchData() async {
    // Cria instância
    MssqlConnection mssqlConnection = MssqlConnection.getInstance();
    // Conecta no banco
    try {
      bool isConnected = await mssqlConnection.connect(
        ip: dotenv.env["IP"] ?? "",
        port: dotenv.env["PORT"] ?? "",
        databaseName: dotenv.env["DATABASE"] ?? "",
        username: dotenv.env["USERNAME"] ?? "",
        password: dotenv.env["PASSWORD"] ?? "",
        timeoutInSeconds: dotenv.getInt("TIMEOUTSECONDS"),
      );
      if (isConnected) {
        String query = 'SELECT * FROM your_table';
        String result = await mssqlConnection.getData(query);
      }
    } catch (e) {
      throw Exception("Erro ao conectar: $e");
    }
  }
}
