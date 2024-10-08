import 'package:flutter/material.dart';
import 'package:urban_green/shared/style/colors.dart';
import 'package:urban_green/shared/style/components/custom_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                    right: deviceInfo.size.width * 0.1),
                height: deviceInfo.size.height * 0.7,
                width: deviceInfo.size.width,
                decoration: const BoxDecoration(
                    color: AppColors.color3,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  children: [
                    CustomizedTextForm(
                      label: '',
                    ),
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
