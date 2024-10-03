import 'package:urban_green/data/pedido_mock.dart';
import 'package:urban_green/model/pedido.dart';

class ClienteController {
  List<PedidoVenda> pedidos = [];

  ClienteController() {
    consultaHistoricoVenda();
  }

  void consultaHistoricoVenda() {
    pedidos = pedidosMock;
  }

  bool login() {
    return true;
  }

  bool logoff() {
    return true;
  }
}
