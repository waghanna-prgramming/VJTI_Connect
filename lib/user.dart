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
}