import 'package:flutter/material.dart';

import '../../widgets/domain_card.dart';

class DataPlacements extends StatefulWidget {
  const DataPlacements({super.key});

  @override
  State<DataPlacements> createState() => _DataPlacementsState();
}

class _DataPlacementsState extends State<DataPlacements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F4F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F4F8),
        automaticallyImplyLeading: false,
        actions: [],
        centerTitle: true,
        title: Text('Data Science/Analyst'),
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
              Domains(domainName: 'Resume Repository'),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              Domains(domainName: 'Interview Experiences'),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              Domains(domainName: 'Preparation Material'),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              Domains(domainName: 'Important Courses'),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              Domains(domainName: 'Other Aspects'),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              Domains(domainName: 'General Tips'),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              Domains(domainName: 'Companies at VJTI'),
            ],
          ),
        ],
      ),
    );
  }
}
