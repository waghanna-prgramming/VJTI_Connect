import 'package:demo_connect/providers/resume_provider.dart';
import 'package:demo_connect/screens/category_page.dart';
import 'package:demo_connect/widgets/domain_card.dart';
import 'package:flutter/material.dart';

import '../common/scaffold_key.dart';

class ResumeRepository extends StatefulWidget {
  final String domain, drive, title, domainID, driveID;
  const ResumeRepository(
      {required this.domain,
      required this.domainID,
      required this.drive,
      required this.driveID,
      required this.title});

  @override
  State<ResumeRepository> createState() => _ResumeRepositoryState();
}

class _ResumeRepositoryState extends State<ResumeRepository> {
  late ResumeProvider resumeProvider = ResumeProvider(
      drive: widget.drive,
      domain: widget.domain,
      driveID: widget.driveID,
      domainID: widget.domainID);
  @override
  Widget build(BuildContext context) {
    Map<String, Map<String, String>> dataMap = resumeProvider.getResume;
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
        title: Text('Resume Repository'),
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
          String year = dataMap.keys.elementAt(index);
          Map<String, String> yearData = dataMap[year]!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  year,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                  itemCount: yearData.length >= 3 ? 3 : yearData.length,
                  itemBuilder: (context, studIndex) {
                    String studName = yearData.keys.elementAt(studIndex);
                    String resumeLink = yearData[studName]!;

                    return GestureDetector(
                      child: DomainCard(domainName: studName),
                      onTap: () {
                        //TODO: redirect ot PDF viewer
                      },
                    );
                  }),
            ],
          );
        },
      ),
    );
  }
}
