import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:urban_green/model/cliente.dart';
import 'package:urban_green/model/endereco.dart';
import 'package:urban_green/model/pedido.dart';
import 'package:urban_green/model/produto_acabado.dart';

class PedidoController {
  List<PedidoVenda> pedidosCliente = [
    PedidoVenda(1, 10,
        cliente: Cliente(
            enderecoEntrega: Endereco(
                rua: "Avenida São Camilo", complemento: "", numero: 120)),
        situacao: "Em processamento",
        itensPedido: [ProdutoAcabado(10, "Alface", 20, 10)]),
  ];
  PedidoController();
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
        String query = 'SELECT * FROM usuarios';
        String result = await mssqlConnection.getData(query);
        debugPrint(result);
        mssqlConnection.disconnect();
      }
    } catch (e) {
      throw Exception("Erro ao conectar: $e");
    }
  }
}
