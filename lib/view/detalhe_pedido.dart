import 'package:flutter/material.dart';
import 'package:urban_green/model/pedido.dart';
import 'package:urban_green/shared/style/colors.dart';
import 'package:urban_green/shared/style/components/itens_pedido.dart';
import 'package:urban_green/shared/style/components/pedido_widget.dart';

class DetalhePedido extends StatelessWidget {
  final PedidoVenda pedidoVenda;
  const DetalhePedido({super.key, required this.pedidoVenda});

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Scaffold(
        body: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
      Container(
          height: deviceInfo.size.height,
          width: deviceInfo.size.width,
          color: AppColors.color1,
          child: Column(children: [
            SizedBox(
              height: deviceInfo.size.height * 0.2,
              child: Image.asset('assets/images/app_icon_white.png'),
            ),
            Container(
                padding: EdgeInsets.only(
                  top: 30,
                  left: deviceInfo.size.width * 0.07,
                  right: deviceInfo.size.width * 0.07,
                ),
                height: deviceInfo.size.height * 0.8,
                width: deviceInfo.size.width,
                decoration: const BoxDecoration(
                    color: AppColors.color3,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PedidoWidget(
                        deviceInfo.size.height * 0.32,
                        deviceInfo.size.width,
                        pedidoVenda,
                      ),
                      ItensPedido(
                        deviceInfo.size.height * 0.35,
                        deviceInfo.size.width,
                        pedidoVenda,
                      )
                    ],
                  ),
                ))
          ]))
    ]));
  }
}
