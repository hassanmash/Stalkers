import 'package:flutter/material.dart';
import 'package:stalkers/apis/users_data_api.dart';
import 'package:stalkers/pages/homepage.dart';
import 'package:stalkers/pages/loginpage.dart';
import 'package:stalkers/pages/signuppage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UsersDataApi.init();

  runApp(MaterialApp(
    title: "Stalkers",
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    routes: {
      "/home": (context) => HomePage(),
      "/login": (context) => LoginPage(),
      "/signup": (context) => SignUpPage(),
      // "/search": (context) => SearchPage(),
    },
  ));
}
