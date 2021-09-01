import 'package:flutter/material.dart';
import 'package:stalkers/pages/homepage.dart';
import 'package:stalkers/pages/loginpage.dart';

void main() {
  runApp(MaterialApp(
    title: "Stalkers",
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    routes: {
      "/home": (context) => HomePage(),
      "/login": (context) => LoginPage(),
      // "/search": (context) => SearchPage(),
    },
  ));
}
