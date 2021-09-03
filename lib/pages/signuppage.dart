import 'package:flutter/material.dart';
import 'package:stalkers/widgets/bgImage.dart';
import 'package:stalkers/widgets/logoImage.dart';
import 'package:stalkers/widgets/signupcard.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            BgImage(),
            LogoImage(),
            SignUpCard(),
          ],
        ),
      ),
    );
  }
}
