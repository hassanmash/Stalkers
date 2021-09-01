import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  const BgImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/stalking.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      fit: BoxFit.cover,
    );
  }
}
