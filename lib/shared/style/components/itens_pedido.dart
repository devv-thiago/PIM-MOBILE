import 'package:flutter/material.dart';
import 'package:urban_green/model/pedido.dart';
import 'package:urban_green/shared/style/colors.dart';
import 'package:urban_green/shared/style/fontstyle.dart';
import 'package:intl/intl.dart';

class ItensPedido extends StatelessWidget {
  final PedidoVenda pedidoVenda;
  final double height, width;

  const ItensPedido(
    this.height,
    this.width,
    this.pedidoVenda, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(
          color: AppColors.color5,
        ),
      ),
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: deviceInfo.size.width * 0.05,
              right: deviceInfo.size.width * 0.05,
              top: deviceInfo.size.height * 0.015,
            ),
            child: Text(
              "Itens do Pedido",
              style: CustomizedFontStyle.headerGreen3,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: deviceInfo.size.width * 0.05,
            ),
            child: SizedBox(
              height: height *
                  0.8, // Ajustar a altura do ListView conforme necessário
              child: ListView.builder(
                itemCount: pedidoVenda.itensPedido.length,
                itemBuilder: (context, index) {
                  final item = pedidoVenda.itensPedido[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0), // Adicionando padding entre os itens
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.nome,
                          style: CustomizedFontStyle.headerGreen3,
                        ),
                        Text(
                          "Quantidade: ${item.quantidade}",
                          style: CustomizedFontStyle.headerGray3,
                        ),
                        Text(
                          "Preço: ${NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(item.preco)}",
                          style: CustomizedFontStyle.headerGray3,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
