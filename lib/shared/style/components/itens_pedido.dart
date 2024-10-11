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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 50),
              height: deviceInfo.size.height * 0.2,
              width: deviceInfo.size.width,
              child: ListView.builder(
                itemCount: pedidoVenda.itensPedido.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                        pedidoVenda.itensPedido[index].nome,
                        style: CustomizedFontStyle.headerGreen3,
                      ),
                      Text(
                        pedidoVenda.itensPedido[index].quantidade.toString(),
                        style: CustomizedFontStyle.headerGray3,
                      ),
                      Text(
                        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                            .format(pedidoVenda.itensPedido[index].preco),
                        style: CustomizedFontStyle.headerGray3,
                      ),
                    ],
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
