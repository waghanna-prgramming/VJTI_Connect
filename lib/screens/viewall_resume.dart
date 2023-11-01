import 'package:demo_connect/screens/select_year_resume.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/domain_card.dart';

class ViewAllResume extends StatefulWidget {
  late Map<String, String>? dataMap;
  final String domain, drive, title, domainID, driveID, year;
  ViewAllResume(
      {required this.domain,
      required this.domainID,
      required this.drive,
      required this.driveID,
      required this.title,
      required this.year,
      required this.dataMap});

  @override
  State<ViewAllResume> createState() => _ViewAllResumeState();
}

class _ViewAllResumeState extends State<ViewAllResume> {
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F8),
      // key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F4F8),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF14181B),
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => SelectYearResume(
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
        title: Text(widget.year),
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
        itemCount: 1,
        itemBuilder: (context, index) {
          // print(dataMap[dataMap.keys.elementAt(index)]!);
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: widget.dataMap!.keys.map((name) {
                  return GestureDetector(
                    child: DomainCard(domainName: name),
                    onTap: () {
                      _launchUrl(
                        Uri.parse(widget.dataMap![name]!),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: 30,
                width: double.infinity,
              ),
              Divider(
                height: 1.0,
              ),
              SizedBox(
                height: 30,
                width: double.infinity,
              ),
            ],
          );
        },
      ),
    );
  }
}
