import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(-0.01, -0.85),
      child: Image.asset(
        'assets/images/LOGO.png',
        width: 300,
        height: 100,
        fit: BoxFit.contain,
      ),
    );
  }
}
