import 'package:flutter/material.dart';
import 'package:urban_green/controller/cliente.dart';
import 'package:urban_green/shared/style/components/pedido_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    ClienteController clienteController = ClienteController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: deviceInfo.size.height * 0.8,
        width: deviceInfo.size.width,
        child: ListView.builder(
          itemCount: clienteController.pedidos.length,
          itemBuilder: (context, index) => PedidoWidget(
            deviceInfo.size.height * 0.2,
            deviceInfo.size.width * 0.7,
            clienteController.pedidos[index],
          ),
        ),
      ),
    );
  }
}
