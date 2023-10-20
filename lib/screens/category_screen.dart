import 'package:demo_connect/screens/companies_screen.dart';
import 'package:demo_connect/screens/courses_screen.dart';
import 'package:demo_connect/screens/domain_page.dart';
import 'package:demo_connect/screens/prepmaterial_screen.dart';
import 'package:demo_connect/screens/resume_repo.dart';
// import 'package:demo_connect/screens/resume_reporeen.dart';
import 'package:demo_connect/screens/select_company.dart';
import 'package:demo_connect/screens/tips_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/domain_card.dart';

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
                builder: (context) => DomainPage(
                  drive: widget.drive,
                  driveID: widget.driveID,
                ),
              ),
            );
          },
        ),
        centerTitle: true,
        title: Text(widget.title),
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
              GestureDetector(
                child: DomainCard(
                  domainName: 'Resume',
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResumeRepository(
                      drive: widget.drive,
                      domain: 'IT-SoftwareDevelopment',
                      title: 'IT/TECH',
                      domainID: widget.domainID,
                      driveID: widget.driveID,
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
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
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              GestureDetector(
                child: DomainCard(
                  domainName: 'Preparation Material',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrepMaterial(),
                    ),
                  );
                },
              ),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              GestureDetector(
                child: DomainCard(
                  domainName: 'Important Courses',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImpCourses(),
                    ),
                  );
                },
              ),
              // SizedBox.fromSize(
              //   size: Size(20.0, 15.0),
              // ),
              // DomainCard(domainName: 'Other Aspects'),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              GestureDetector(
                child: DomainCard(
                  domainName: 'General Tips',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GeneralTips(),
                    ),
                  );
                },
              ),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              GestureDetector(
                child: DomainCard(
                  domainName: 'Companies at VJTI',
                ),
                onTap: () {
                  _launchUrl(
                    Uri.parse('https://vjti.ac.in/wp-content/uploads/2023/05/Comapny-name-list-1.pdf'),
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
