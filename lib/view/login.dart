import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urban_green/shared/style/colors.dart';
import 'package:urban_green/shared/style/fontstyle.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController codRegistroController;
  late TextEditingController passwordController;

  @override
  void dispose() {
    codRegistroController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    codRegistroController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, Object? result) async {
          if (didPop) {
            return;
          }
          final bool shouldPop = await _showBackDialog() ?? false;
          if (context.mounted && shouldPop) {
            SystemNavigator.pop();
          }
        },
        child: Scaffold(
            body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(right: 20, left: 20),
            height: deviceInfo.size.height,
            width: deviceInfo.size.width,
            decoration: const BoxDecoration(
              color: AppColors.background,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(
                  size: deviceInfo.size.height * 0.2,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: AppColors.background2,
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: AppColors.background2,
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: deviceInfo.size.height * 0.06,
                  width: deviceInfo.size.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(AppColors.color1)),
                    child: const Text(
                      "Entrar",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )));
  }

  Future<bool?> _showBackDialog() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Sair?',
            style: CustomizedFontStyle.header3,
          ),
          content: Text(
            'Tem certeza que deseja sair?',
            style: CustomizedFontStyle.paragraph1,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text(
                'Não',
                style: CustomizedFontStyle.infoParagraph,
              ),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: Text(
                'Sim',
                style: CustomizedFontStyle.infoParagraph,
              ),
            ),
          ],
        );
      },
    );
  }
}
