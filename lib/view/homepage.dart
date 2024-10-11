import 'package:flutter/material.dart';
import 'package:urban_green/controller/cliente.dart';
import 'package:urban_green/shared/style/colors.dart';
import 'package:urban_green/shared/style/components/pedido_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    ClienteController clienteController = ClienteController();

    return Scaffold(
      body: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
        Container(
          height: deviceInfo.size.height,
          width: deviceInfo.size.width,
          color: AppColors.color1,
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: deviceInfo.size.height * 0.3,
                child: Image.asset('assets/images/app_icon_white.png'),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: deviceInfo.size.width * 0.07,
                    right: deviceInfo.size.width * 0.07,
                    bottom: deviceInfo.size.height * 0.1),
                height: deviceInfo.size.height,
                width: deviceInfo.size.width,
                decoration: const BoxDecoration(
                    color: AppColors.color3,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 50),
                        height: deviceInfo.size.height,
                        width: deviceInfo.size.width,
                        child: ListView.builder(
                          itemCount: clienteController.pedidos.length,
                          itemBuilder: (context, index) => PedidoWidget(
                            deviceInfo.size.height * 0.3,
                            deviceInfo.size.width * 0.7,
                            clienteController.pedidos[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
        ),
      ]),
    );
  }
}
