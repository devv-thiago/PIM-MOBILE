import 'package:urban_green/model/pedido.dart';

class ClienteController {
  List<PedidoVenda> pedidos = [];

  List<PedidoVenda> consultaHistoricoVenda() {
    pedidos = [];
    return pedidos;
  }

  bool login() {
    return true;
  }

  bool logoff() {
    return true;
  }
}
