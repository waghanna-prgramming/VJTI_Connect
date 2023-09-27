import 'package:flutter/material.dart';

import '../widgets/domain_card.dart';

class InternshipDomains extends StatefulWidget {
  const InternshipDomains({super.key});

  @override
  State<InternshipDomains> createState() => _InternshipDomainsState();
}

class _InternshipDomainsState extends State<InternshipDomains> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F4F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F4F8),
        automaticallyImplyLeading: false,
        actions: [],
        centerTitle: true,
        title: Text('Select Your Domain'),
        titleTextStyle: TextStyle(
          fontFamily: 'Sora',
          color: Color(0xFF14181B),
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
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
