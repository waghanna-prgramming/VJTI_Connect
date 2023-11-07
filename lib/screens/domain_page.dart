import 'package:demo_connect/dump/test_home_screen.dart';
import 'package:demo_connect/screens/category_screen.dart';
import 'package:demo_connect/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../common/heading.dart';
import '../widgets/domain_card.dart';

class DomainPage extends StatefulWidget {
  // internship/placement
  final String drive;
  final String driveID;
  const DomainPage({required this.drive, required this.driveID});

  @override
  State<DomainPage> createState() => _DomainPageState();
}

class _DomainPageState extends State<DomainPage> {
  // get drive => null;

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
                builder: (context) => TestHomeScreen(),
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
              Header(heading: 'Domains'),
              GestureDetector(
                  child: DomainCard(
                    domainName: 'IT/Tech',
                  ),
                  onTap: () {
                    String domainID = widget.driveID == 'jt4whg5R0mxaJVbAphVd'
                        ? 'rVPe8JohuK1U9vvNeEDp'
                        : 'QhMGOnaK4qDfeQlNrNhm';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryPage(
                          drive: widget.drive,
                          driveID: widget.driveID,
                          domain: 'IT-SoftwareDevelopment',
                          title: 'IT/TECH',
                          domainID: domainID,
                        ),
                      ),
                    );
                  },),
              GestureDetector(
                  child: DomainCard(
                    domainName: 'Data Science',
                  ),
                  onTap: () {
                    String domainID = widget.driveID == 'jt4whg5R0mxaJVbAphVd'
                        ? 'mLWX9ixk0SuFrbIYaLs1'
                        : 'edGDZsvRkYBnLFZ5MSAm';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryPage(
                          drive: widget.drive,
                          driveID: widget.driveID,
                          domainID: domainID,
                          domain: 'AnalyticsAndDataScience',
                          title: 'DATA SCIENCE',
                        ),
                      ),
                    );
                  },),
              GestureDetector(
                  child: DomainCard(
                    domainName: 'Consulting',
                  ),
                  onTap: () {
                    String domainID = widget.driveID == 'jt4whg5R0mxaJVbAphVd'
                        ? 'NkKjb6dSx5YnNObRfphq'
                        : 'sR3PDWwlqsiGzHpBBaw1';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryPage(
                          drive: widget.drive,
                          driveID: widget.driveID,
                          domainID: domainID,
                          domain: 'Consulting',
                          title: 'CONSULTING',
                        ),
                      ),
                    );
                  },),
              GestureDetector(
                  child: DomainCard(domainName: 'Core'),
                  onTap: () {
                    String domainID = widget.driveID == 'jt4whg5R0mxaJVbAphVd'
                        ? '6WNYZSe3uxJHL5B3vWxi'
                        : 'wZlY0aTQFlQOmRRCVaqQ';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryPage(
                          drive: widget.drive,
                          driveID: widget.driveID,
                          domainID: domainID,
                          domain: 'Core',
                          title: 'CORE',
                        ),
                      ),
                    );
                  },),
              GestureDetector(
                  child: DomainCard(
                    domainName: 'Finance and Management',
                  ),
                  onTap: () {
                    String domainID = widget.driveID == 'jt4whg5R0mxaJVbAphVd'
                        ? 'hc2afBqGjXjn3ELADxFy'
                        : 'g5BVC9Q1TFFMdxIfGJyY';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryPage(
                          driveID: widget.driveID,
                          domainID: domainID,
                          drive: widget.drive,
                          domain: 'Finance',
                          title: 'FINANCE & MGMT',
                        ),
                      ),
                    );
                  },),
              GestureDetector(
                  child: DomainCard(
                    domainName: 'Post Graduation',
                  ),
                  onTap: () {
                    String domainID = widget.driveID == 'jt4whg5R0mxaJVbAphVd'
                        ? '5bBTFP2Iil6yhSSgG0t5'
                        : 'ySmkSAU1ZGWisnBG4WAb';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryPage(
                          drive: widget.drive,
                          driveID: widget.driveID,
                          domainID: domainID,
                          domain: 'Research',
                          title: 'POST GRADUATION',
                        ),
                      ),
                    );
                  },),
              DomainCard(domainName: 'Others'),
            ],
          ),
        ],
      ),
    );
  }
}
