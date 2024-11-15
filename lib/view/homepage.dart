import 'package:flutter/material.dart';
import 'package:urban_green/controller/pedido_controller.dart';
import 'package:urban_green/shared/style/colors.dart';
import 'package:urban_green/shared/style/components/pedido_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    PedidoController pedidoController = PedidoController();

    return Scaffold(
      body: Container(
        height: deviceInfo.size.height,
        width: deviceInfo.size.width,
        color: AppColors.color1,
        child: Column(
          children: [
            SizedBox(
              height: deviceInfo.size.height * 0.3,
              child: Image.asset('assets/images/app_icon_white.png'),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: deviceInfo.size.width * 0.07, vertical: 10),
                decoration: const BoxDecoration(
                  color: AppColors.color3,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView.builder(
                  itemCount: pedidoController.pedidosCliente.length,
                  itemBuilder: (context, index) => PedidoWidget(
                    deviceInfo.size.height * 0.35,
                    deviceInfo.size.width * 0.7,
                    pedidoController.pedidosCliente[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
