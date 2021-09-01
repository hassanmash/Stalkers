import 'package:flutter/material.dart';
import 'package:stalkers/widgets/bgImage.dart';
import 'package:stalkers/widgets/logincard.dart';
import 'package:stalkers/widgets/logoImage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            BgImage(),
            LogoImage(),
            LoginCard(),
          ],
        ),
      ),
    );
  }
}
