import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return SizedBox(
      height: deviceInfo.size.height,
      width: deviceInfo.size.width,
      child: const Center(
        child: Text(
          "Homepage",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
