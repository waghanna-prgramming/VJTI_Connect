import 'package:flutter/material.dart';

class HomeScreenCard extends StatelessWidget {
  String input='';
  HomeScreenCard({required this.input});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.white,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Padding(
            padding:
            EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Text(
              '$input',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
