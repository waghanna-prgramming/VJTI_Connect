import 'package:flutter/material.dart';

import '../../common/scaffold_key.dart';
import '../../widgets/domain_card.dart';
import '../placement_domains.dart';

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
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => PlacementDomains(),),);
          },
        ),
        centerTitle: true,
        title: Text('DATA SCIENCE/ANALYST'),
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
