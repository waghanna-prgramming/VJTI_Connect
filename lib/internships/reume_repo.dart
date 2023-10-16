import 'package:demo_connect/screens/category_page.dart';
import 'package:flutter/material.dart';
import '../common/scaffold_key.dart';
import '../widgets/domain_card.dart';

class ResumeRepository extends StatefulWidget {
  final String domain, drive, title;
  const ResumeRepository({required this.domain, required this.drive, required this.title});

  @override
  State<ResumeRepository> createState() => _ResumeRepositoryState();
}

class _ResumeRepositoryState extends State<ResumeRepository> {
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
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CategoryPage(drive: widget.drive, domain: widget.domain, title: widget.title),),);
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
              DomainCard(domainName: 'Resume Repository'),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              DomainCard(domainName: 'Interview Experiences'),
            ],
          ),
        ],
      ),
    );
  }
}
