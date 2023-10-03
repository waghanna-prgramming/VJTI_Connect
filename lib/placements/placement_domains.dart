import 'package:flutter/material.dart';

import '../common/scaffold_key.dart';
import '../widgets/domain_card.dart';

class PlacementDomains extends StatefulWidget {
  const PlacementDomains({super.key});

  @override
  State<PlacementDomains> createState() => _PlacementDomainsState();
}

class _PlacementDomainsState extends State<PlacementDomains> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F4F8),
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F4F8),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF14181B),
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text('Select Your Domain'),
        titleTextStyle: TextStyle(
          fontFamily: 'Sora',
          color: Color(0xFF14181B),
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        actions: [],
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              Domains(domainName: 'IT/Tech'),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              Domains(domainName: 'Data Science'),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              Domains(domainName: 'Consulting'),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              Domains(domainName: 'Core'),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              Domains(domainName: 'Finance and Management'),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              Domains(domainName: 'Post Graduation'),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              Domains(domainName: 'Post Graduation'),
            ],
          ),
        ],
      ),
    );
  }
}
