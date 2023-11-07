import 'package:demo_connect/screens/courses_screen.dart';
import 'package:demo_connect/screens/domain_page.dart';
import 'package:demo_connect/screens/prepmaterial_screen.dart';
// import 'package:demo_connect/screens/prepmaterial_screenepo.dart';
// import 'package:demo_connect/screens/resume_reporeen.dart';
import 'package:demo_connect/screens/select_company.dart';
import 'package:demo_connect/screens/select_year_resume.dart';
import 'package:demo_connect/screens/tips_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/domain_card.dart';
import '../common/heading.dart';

class CategoryPage extends StatefulWidget {
  final String domain, drive, title, domainID, driveID;
  const CategoryPage(
      {required this.drive,
      required this.driveID,
      required this.domain,
      required this.domainID,
      required this.title});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                builder: (context) => DomainPage(
                  drive: widget.drive,
                  driveID: widget.driveID,
                ),
              ),
            );
          },
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
              SizedBox(
                height: 10,
              ),
              Header(heading: widget.title),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: DomainCard(
                  domainName: 'Resume',
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectYearResume(
                      drive: widget.drive,
                      domain: widget.domain,
                      title: widget.title,
                      domainID: widget.domainID,
                      driveID: widget.driveID,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: DomainCard(
                  domainName: 'Interview Experiences',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectCompany(
                          drive: widget.drive,
                          driveID: widget.driveID,
                          domain: widget.domain,
                          domainID: widget.domainID,
                          title: widget.title),
                    ),
                  );
                },
              ),
              GestureDetector(
                child: DomainCard(
                  domainName: 'Preparation Material',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrepMaterial(
                          drive: widget.drive,
                          driveID: widget.driveID,
                          domain: widget.domain,
                          domainID: widget.domainID,
                          title: widget.title),
                    ),
                  );
                },
              ),
              GestureDetector(
                child: DomainCard(
                  domainName: 'Important Courses',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImpCourses(
                          drive: widget.drive,
                          driveID: widget.driveID,
                          domain: widget.domain,
                          domainID: widget.domainID,
                          title: widget.title),
                    ),
                  );
                },
              ),
              GestureDetector(
                child: DomainCard(
                  domainName: 'General Tips',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GeneralTips(
                          drive: widget.drive,
                          driveID: widget.driveID,
                          domain: widget.domain,
                          domainID: widget.domainID,
                          title: widget.title),
                    ),
                  );
                },
              ),
              GestureDetector(
                child: DomainCard(
                  domainName: 'Companies at VJTI',
                ),
                onTap: () {
                  _launchUrl(
                    Uri.parse(
                        'https://vjti.ac.in/wp-content/uploads/2023/05/Comapny-name-list-1.pdf'),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
