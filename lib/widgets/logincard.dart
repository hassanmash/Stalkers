import 'package:flutter/material.dart';
import 'package:stalkers/apis/users_data_api.dart';
import 'package:stalkers/pages/searchpage.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            color: Colors.grey.withOpacity(0.5),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: userNameController,
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
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            labelText: "Password",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => value != null && value.isEmpty
                              ? 'Enter password'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Go Back"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          final form = formKey.currentState!;
                          final isValid = form.validate();

                          String userName = userNameController.text;
                          String password = passwordController.text;
                          // if (userName == "") {
                          //   userName = "Admin";
                          // }
                          print("Username is " + userName);

                          final users = await UsersDataApi.getAll();
                          print(users.length);
                          for (int i = 0; i < users.length; i++) {
                            // print(i);
                            String name = users[i].userName;
                            print(name);
                            if (name == userName) {
                              if (isValid) {
                                if (password == users[i].password) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchPage(recordName: userName)),
                                  );
                                } else {
                                  _showToast(context);
                                }
                              }
                              break;
                            }
                          }
                          // if (isValid) {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             SearchPage(recordName: userName)),
                          //   );
                          // }
                        },
                        child: Text("Sign In"),
                      ),
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
      content: const Text('Invalid Password.'),
      action: SnackBarAction(
          label: 'Try Again', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
