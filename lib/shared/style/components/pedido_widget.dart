import 'package:flutter/material.dart';
import 'package:urban_green/model/pedido.dart';
import 'package:urban_green/shared/style/colors.dart';
import 'package:urban_green/shared/style/fontstyle.dart';
import 'package:intl/intl.dart';
import 'package:urban_green/view/detalhe_pedido.dart';

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
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetalhePedido(
                    pedidoVenda: pedidoVenda,
                  ))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(
              color: AppColors.color5,
            )),
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              title: Text(
                "Número do Pedido",
                style: CustomizedFontStyle.headerGreen3,
              ),
              subtitle: Text(
                pedidoVenda.numeroPedido.toString().padLeft(4, "0"),
                style: CustomizedFontStyle.headerGray3,
              ),
            ),
            ListTile(
                title: Text(
                  "Valor Total",
                  style: CustomizedFontStyle.headerGreen3,
                ),
                subtitle: Text(
                  NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                      .format(pedidoVenda.preco),
                  style: CustomizedFontStyle.headerGray3,
                )),
            ListTile(
              title: Text(
                "Situação",
                style: CustomizedFontStyle.headerGreen3,
              ),
              subtitle: Text(
                pedidoVenda.situacao,
                style: CustomizedFontStyle.headerGray3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
