import 'dart:convert';

class UserFields {
  static final String id = 'id';
  static final String email = 'email';
  static final String userName = 'userName';
  static final String password = 'password';

  static List<String> getFields() => [id, email, userName, password];
}

class User {
  final int? id;
  final String email;
  final String userName;
  final String password;

  const User({
    this.id,
    required this.email,
    required this.userName,
    required this.password,
  });

  static User fromJson(Map<String, dynamic> json) => User(
        id: jsonDecode(json[UserFields.id]),
        email: json[UserFields.email],
        userName: json[UserFields.userName],
        password: json[UserFields.password],
      );

  Map<String, dynamic> toJson() => {
        UserFields.id: id,
        UserFields.email: email,
        UserFields.userName: userName,
        UserFields.password: password,
      };
}
