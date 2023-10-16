import 'package:demo_connect/internships/reume_repo.dart';
import 'package:demo_connect/screens/domain_page.dart';
import 'package:flutter/material.dart';

import '../../common/scaffold_key.dart';
import '../../widgets/domain_card.dart';

class CategoryPage extends StatefulWidget {
  final String domain, drive, title;
  const CategoryPage(
      {required this.drive, required this.domain, required this.title});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
                builder: (context) => DomainPage(drive: widget.drive),
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
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              DomainCard(domainName: 'Interview Experiences'),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              DomainCard(domainName: 'Preparation Material'),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              DomainCard(domainName: 'Important Courses'),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              DomainCard(domainName: 'Other Aspects'),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              DomainCard(domainName: 'General Tips'),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              DomainCard(domainName: 'Companies at VJTI'),
            ],
          ),
        ],
      ),
    );
  }
}
