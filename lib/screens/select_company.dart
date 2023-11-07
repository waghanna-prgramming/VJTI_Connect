import 'package:demo_connect/providers/experience_provider.dart';
import 'package:demo_connect/screens/category_screen.dart';
import 'package:demo_connect/screens/select_year_interview.dart';
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
    Map<String, Map<int, Map<String, String>>> dataMap =
        experienceProvider.getExperience;
    List<String> companyNames = dataMap.keys.toList();

    return Scaffold(
      backgroundColor: Color(0xFF4F4F5B),
      // key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF4F4F5B),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
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
        actions: [],
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 70, 0),
            child: Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Text(
                'Interview Experience',
                style: TextStyle(
                  fontFamily: 'Sora',
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: companyNames.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      child: DomainCard(
                        domainName: companyNames[index],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectYearInterview(
                                drive: widget.drive,
                                domain: widget.domain,
                                driveID: widget.driveID,
                                domainID: widget.domainID,
                                companyData: dataMap[companyNames[index]]!,
                                title: widget.title,
                            companyName: companyNames[index],),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
