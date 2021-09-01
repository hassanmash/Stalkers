import 'package:flutter/material.dart';
import 'package:stalkers/widgets/bgImage.dart';
import 'package:stalkers/widgets/logincard.dart';
import 'package:stalkers/widgets/logoImage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BgImage(),
            LogoImage(),
            Align(
              alignment: Alignment(-0.01, 0.24),
              child: SizedBox(
                width: 250.0,
                height: 60.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    child: Text("Login"), // Login button
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    )),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.01, 0.46),
              child: SizedBox(
                width: 250.0,
                height: 60.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Sign Up"),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
