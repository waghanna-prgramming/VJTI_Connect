import 'package:demo_connect/home_screen.dart';
import 'package:demo_connect/screens/category_page.dart';
import 'package:flutter/material.dart';

import '../common/scaffold_key.dart';
import '../widgets/domain_card.dart';

class DomainPage extends StatefulWidget {
  // internship/placement
  final String drive;
  const DomainPage({required this.drive});

  @override
  State<DomainPage> createState() => _DomainPageState();
}

class _DomainPageState extends State<DomainPage> {
  // get drive => null;

  @override
  Widget build(BuildContext context) {
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
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
        centerTitle: true,
        title: Text('Select Your Domain'),
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
                  domainName: 'IT/Tech',
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(
                      drive: widget.drive,
                      domain: 'IT-SoftwareDevelopment',
                      title: 'IT/TECH',
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              GestureDetector(
                child: DomainCard(
                  domainName: 'Data Science',
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(
                      drive: widget.drive,
                      domain: 'AnalyticsAndDataScience',
                      title: 'DATA SCIENCE',
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              GestureDetector(
                child: DomainCard(
                  domainName: 'Consulting',
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(
                      drive: widget.drive,
                      domain: 'Consulting',
                      title: 'CONSULTING',
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              GestureDetector(
                child: DomainCard(domainName: 'Core'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(
                      drive: widget.drive,
                      domain: 'Core',
                      title: 'CORE',
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              GestureDetector(
                child: DomainCard(
                  domainName: 'Finance and Management',
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(
                      drive: widget.drive,
                      domain: 'Management',
                      title: 'FINANCE & MGMT',
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              GestureDetector(
                child: DomainCard(
                  domainName: 'Post Graduation',
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(
                      drive: widget.drive,
                      domain: 'Research',
                      title: 'POST GRADUATION',
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              DomainCard(domainName: 'Others'),
            ],
          ),
        ],
      ),
    );
  }
}
