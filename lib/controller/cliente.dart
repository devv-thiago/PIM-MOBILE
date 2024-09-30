import 'package:urban_green/model/pedido.dart';

class ClienteController {
  List<PedidoVenda> pedidos = [];

  void atualizarEndereco() {
    throw UnimplementedError();
  }

  List<PedidoVenda> consultaHistoricoVenda() {
    pedidos = [];
    return pedidos;
  }
}
