import 'package:demo_connect/screens/select_year_resume.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common/heading.dart';
import '../widgets/domain_card.dart';

class SelectedYearPDFs extends StatefulWidget {
  late Map<String, String>? dataMap;
  final String domain, drive, title, domainID, driveID, year;
  SelectedYearPDFs(
      {required this.domain,
      required this.domainID,
      required this.drive,
      required this.driveID,
      required this.title,
      required this.year,
      required this.dataMap});

  @override
  State<SelectedYearPDFs> createState() => _SelectedYearPDFsState();
}

class _SelectedYearPDFsState extends State<SelectedYearPDFs> {
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4F4F5B),
      // key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF4F4F5B),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
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
        actions: [],
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 10,
          ),
          Header(heading: widget.year),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                // print(dataMap[dataMap.keys.elementAt(index)]!);
                return Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
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
          ),
        ],
      ),
    );
  }
}
