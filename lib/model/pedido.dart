import 'package:urban_green/model/abstract/abstract_pedido.dart';
import 'package:urban_green/model/cliente.dart';

class PedidoVenda extends Pedido {
  String situacao;
  Cliente cliente;

  PedidoVenda(
    super.numeroPedido,
    super.preco, {
    required this.cliente,
    required this.situacao,
  });
}
