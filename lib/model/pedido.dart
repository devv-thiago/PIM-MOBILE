import 'package:urban_green/model/abstract/abstract_pedido.dart';
import 'package:urban_green/model/cliente.dart';
import 'package:urban_green/model/produto_acabado.dart';

class PedidoVenda extends Pedido {
  String situacao;
  Cliente cliente;
  List<ProdutoAcabado> itensPedido = [];

  PedidoVenda(
    super.numeroPedido,
    super.preco, {
    required this.cliente,
    required this.situacao,
    required this.itensPedido,
  });
}
