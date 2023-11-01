import 'package:demo_connect/providers/resume_provider.dart';
import 'package:demo_connect/screens/viewall_resume.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/domain_card.dart';
import 'category_screen.dart';

class SelectYearResume extends StatefulWidget {
  final String domain, drive, title, domainID, driveID;
  const SelectYearResume(
      {required this.drive,
      required this.driveID,
      required this.domain,
      required this.domainID,
      required this.title});

  @override
  State<SelectYearResume> createState() => _SelectYearResumeState();
}

class _SelectYearResumeState extends State<SelectYearResume> {
  late ResumeProvider resumeProvider;

  @override
  void initState() {
    // TODO: implement initState
    ResumeProvider resumeProvider = Provider.of(context, listen: false);
    resumeProvider.fetchResume(
        drive: widget.drive,
        domain: widget.domain,
        driveID: widget.driveID,
        domainID: widget.domainID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    resumeProvider = Provider.of(context);
    List<int> yearList = resumeProvider.getYears;
    Map<int, Map<String, String>> dataMap = resumeProvider.getResume;

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
        title: Text('Select Year'),
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
        itemCount: yearList.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              GestureDetector(
                child: DomainCard(
                  domainName: yearList[index].toString(),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewAllResume(
                          drive: widget.drive,
                          domain: widget.domain,
                          driveID: widget.driveID,
                          domainID: widget.domainID,
                          dataMap: dataMap[yearList[index]],
                          year: yearList[index].toString(),
                          title: widget.title),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
