import 'package:flutter/material.dart';

class Domains extends StatelessWidget {
  String domainName = '';
  Domains({required this.domainName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Color(0xFF352D47),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding:
          EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '$domainName',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
