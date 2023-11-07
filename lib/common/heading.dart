import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String heading;
  Header({required this.heading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text(
        heading,
        style: TextStyle(
          fontFamily: 'Sora',
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
