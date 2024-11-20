import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urban_green/controller/cliente.dart';
import 'package:urban_green/shared/style/colors.dart';
import 'package:urban_green/shared/style/components/custom_field.dart';
import 'package:urban_green/shared/style/fontstyle.dart';
import 'package:urban_green/view/homepage.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceInfo = MediaQuery.of(context);

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
                    left: deviceInfo.size.width * 0.1,
                    right: deviceInfo.size.width * 0.1,
                    bottom: deviceInfo.size.height * 0.1),
                height: deviceInfo.size.height * 0.7,
                width: deviceInfo.size.width,
                decoration: const BoxDecoration(
                    color: AppColors.color3,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      width: deviceInfo.size.width,
                      height: deviceInfo.size.height * 0.1,
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Bem vindo :)",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: AppColors.color1,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                      ),
                    ),
                    CustomizedTextForm(
                      title: "Usuário",
                      label: "Digite seu usuário",
                      controller: usuarioController,
                    ),
                    SizedBox(
                      height: deviceInfo.size.height * 0.01,
                    ),
                    CustomizedTextForm(
                      title: "Senha",
                      label: "Digite sua senha",
                      controller: senhaController,
                    ),
                    SizedBox(
                      height: deviceInfo.size.height * 0.05,
                    ),
                    SizedBox(
                      width: deviceInfo.size.width,
                      height: deviceInfo.size.height * 0.065,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                            AppColors.color1,
                          )),
                          onPressed: () async {
                            ClienteController clienteController =
                                ClienteController();

                            bool login = await clienteController.login(
                                usuarioController.text, senhaController.text);
                            (login)
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Homepage()))
                                : showDialog<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Credenciais inválidas',
                                          style:
                                              CustomizedFontStyle.headerGreen3,
                                        ),
                                        content: Text(
                                          'Revise as informações fornecidas',
                                          style: CustomizedFontStyle.paragraph1,
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              textStyle: CustomizedFontStyle
                                                  .paragraph1,
                                            ),
                                            child: Text(
                                              'Ok',
                                              style: CustomizedFontStyle
                                                  .headerGreen3,
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    });
                          },
                          child: Text(
                            "Entrar",
                            style: CustomizedFontStyle.paragraphWhite1,
                          )),
                    )
                  ],
                ),
              )
            ],
          )),
        ),
      ]),
    );
  }
}
