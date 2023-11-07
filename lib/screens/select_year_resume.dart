import 'package:demo_connect/providers/resume_provider.dart';
import 'package:demo_connect/screens/selected_year_pdfs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/domain_card.dart';
import 'category_screen.dart';

class SelectYearResume extends StatefulWidget {
  final String domain, drive, title, domainID, driveID;
  const SelectYearResume({
    super.key,
    required this.drive,
    required this.driveID,
    required this.domain,
    required this.domainID,
    required this.title,
  });

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
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 100, 0),
            child: Text(
              'Resume Repository',
              style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: yearList.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      child: DomainCard(
                        domainName: yearList[index].toString(),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectedYearPDFs(
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
          ),
        ],
      ),
    );
  }
}
