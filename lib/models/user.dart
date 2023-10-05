import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final int regno;
  final String email;
  final String password;

  const User(
      {required this.username,
        required this.regno,
        required this.email,
        required this.password});

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot["username"],
      regno: snapshot["regno"],
      email: snapshot["email"],
      password: snapshot["password"],
    );
  }

  Map<String, dynamic> toJson() => {
    "username": username,
    "regno": regno,
    "email": email,
    "password": password,
  };
}