import 'package:demo_connect/providers/experience_provider.dart';
import 'package:demo_connect/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/domain_card.dart';

class SelectCompany extends StatefulWidget {
  final String domain, drive, title, domainID, driveID;
  const SelectCompany(
      {required this.drive,
      required this.driveID,
      required this.domain,
      required this.domainID,
      required this.title});

  @override
  State<SelectCompany> createState() => _SelectCompanyState();
}

class _SelectCompanyState extends State<SelectCompany> {
  late ExperienceProvider experienceProvider;

  @override
  void initState() {
    // TODO: implement initState
    ExperienceProvider experienceProvider = Provider.of(context, listen: false);
    experienceProvider.fetchExperience(
        drive: widget.drive,
        domain: widget.domain,
        driveID: widget.driveID,
        domainID: widget.domainID);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    experienceProvider = Provider.of(context);
    List<String> dataMap = experienceProvider.getCompanyNames;

    return Scaffold(
      backgroundColor: Color(0xFFF1F4F8),
      // key: scaffoldKey,
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
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => CategoryPage(
                    drive: widget.drive,
                    driveID: widget.driveID,
                    domain: widget.domain,
                    domainID: widget.domainID,
                    title: widget.title),
              ),
            );
          },
        ),
        centerTitle: true,
        title: Text('Select Company'),
        titleTextStyle: TextStyle(
          fontFamily: 'Sora',
          color: Color(0xFF14181B),
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        actions: [],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: dataMap.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              DomainCard(
                domainName: dataMap[index],
              ),
            ],
          );
        },
      ),
    );
  }
}
