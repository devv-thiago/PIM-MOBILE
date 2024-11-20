import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:urban_green/model/cliente.dart';
import 'package:urban_green/model/endereco.dart';
import 'package:urban_green/model/pedido.dart';
import 'package:urban_green/model/produto_acabado.dart';

class PedidoController {
  PedidoController();

  List<PedidoVenda> pedidosCliente = [];

  Future<void> retornaPedidos(String documentoCliente) async {
    // Cria instância
    MssqlConnection mssqlConnection = MssqlConnection.getInstance();

    try {
      // Conecta no banco
      bool isConnected = await mssqlConnection.connect(
        ip: dotenv.env["IP"] ?? "",
        port: dotenv.env["PORT"] ?? "",
        databaseName: dotenv.env["DATABASE"] ?? "",
        username: dotenv.env["USERNAME"] ?? "",
        password: dotenv.env["PASSWORD"] ?? "",
        timeoutInSeconds: dotenv.getInt("TIMEOUTSECONDS"),
      );

      if (isConnected) {
        String query = '''SELECT  ped.IdPedidoVenda     AS NUMERO_PEDIDO,
                                  prdVen.NomeProduto    AS PRODUTO,
                                  prdVen.Quantidade     AS QTD_REQ_PEDIDO,
                                  prdAca.PrecoUnitario  AS PRECO_UN,
                                  endCli.Rua            AS RUA,
                                  endCli.Numero         AS NUMERO
                      FROM PedidoVenda ped 
                      INNER JOIN ProdutoVenda prdVen        ON ped.IdPedidoVenda    = prdVen.IdPedidoVenda
                      INNER JOIN ProdutoAcabado prdAca      ON prdVen.NomeProduto   = prdAca.NomeProdutoAcabado
                      INNER JOIN Cliente cli                ON ped.DocumentoCliente = cli.DocumentoCliente
                      INNER JOIN EnderecoCliente endCli     ON cli.IdEnderecoCliente = endCli.IdEnderecoCliente
                      WHERE ped.DocumentoCliente = '$documentoCliente'
                      ORDER BY ped.IdPedidoVenda;''';

        // Executa a consulta e obtém o resultado como string
        String resultString = await mssqlConnection.getData(query);

        // Converte o resultado para uma lista estruturada
        List<dynamic> result = jsonDecode(resultString);

        // Desconecta do banco
        mssqlConnection.disconnect();

        Map<int, PedidoVenda> pedidosMap = {};

        for (var row in result) {
          int numeroPedido = row["NUMERO_PEDIDO"];
          double precoUnitario = row["PRECO_UN"];
          int quantidade = row["QTD_REQ_PEDIDO"];
          double precoTotalItem = precoUnitario * quantidade;

          if (!pedidosMap.containsKey(numeroPedido)) {
            Endereco endereco = Endereco(
              rua: row["RUA"],
              numero: row["NUMERO"],
              complemento: "",
            );

            Cliente cliente = Cliente(
              enderecoEntrega: endereco,
            );

            pedidosMap[numeroPedido] = PedidoVenda(
              numeroPedido,
              0, // O total será calculado ao somar os itens
              cliente: cliente,
              situacao: "Em processamento",
              itensPedido: [],
            );
          }

          ProdutoAcabado produto = ProdutoAcabado(
            quantidade,
            row["PRODUTO"],
            0,
            precoTotalItem,
          );

          pedidosMap[numeroPedido]!.itensPedido.add(produto);
          pedidosMap[numeroPedido]!.preco += precoTotalItem;
        }

        // Converte o mapa em uma lista
        pedidosCliente = pedidosMap.values.toList();
      }
    } catch (e) {
      throw Exception("Erro ao conectar: $e");
    }
  }
}
