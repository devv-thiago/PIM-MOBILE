import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:urban_green/model/pedido.dart';

class PedidoWidget extends StatelessWidget {
  final PedidoVenda pedidoVenda;
  final double height, width;

  const PedidoWidget(
    this.height,
    this.width,
    this.pedidoVenda, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${pedidoVenda.numeroPedido}",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              decoration: TextDecoration.none,
            ),
          ),
          Text(
            pedidoVenda.situacao,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              decoration: TextDecoration.none,
            ),
          ),
          Text(
            "${pedidoVenda.preco}",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              decoration: TextDecoration.none,
            ),
          ),
          Text(
            "${pedidoVenda.cliente.enderecoEntrega.rua}, ${pedidoVenda.cliente.enderecoEntrega.numero}",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
