import 'package:flutter/material.dart';
import 'package:stalkers/apis/users_data_api.dart';
import 'package:stalkers/model/user.dart';

class SignUpCard extends StatefulWidget {
  const SignUpCard({Key? key}) : super(key: key);

  @override
  _SignUpCardState createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  final formSignKey = GlobalKey<FormState>();
  final emailIdTextController = TextEditingController();
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Card(
            color: Colors.grey.withOpacity(0.5),
            child: Column(
              children: [
                Form(
                  key: formSignKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailIdTextController,
                          decoration: InputDecoration(
                            hintText: "Email ID",
                            labelText: "Email ID",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) =>
                              value != null && !value.contains('@')
                                  ? 'Enter Email'
                                  : null,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: usernameTextController,
                          decoration: InputDecoration(
                            hintText: "Username",
                            labelText: "Username",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => value != null && value.isEmpty
                              ? 'Enter Username'
                              : null,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: passwordTextController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            labelText: "Password",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => value != null && value.isEmpty
                              ? 'Enter Password'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Go Back"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final form = formSignKey.currentState!;
                        final isValid = form.validate();

                        final int getId = await UsersDataApi.getRowCount() + 1;

                        if (isValid) {
                          final user = User(
                            id: getId,
                            email: emailIdTextController.text.toString(),
                            userName: usernameTextController.text.toString(),
                            password: passwordTextController.text.toString(),
                          );
                          print(user.toJson());
                          await UsersDataApi.insert([user.toJson()]);
                          _showToast(
                              context); // Toast message after successfull registration.
                          emailIdTextController.text = "";
                          usernameTextController.text = "";
                          passwordTextController.text = "";
                        }
                      },
                      child: Text("Register"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showToast(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('Succesfully created. Go back to login.'),
      action:
          SnackBarAction(label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
