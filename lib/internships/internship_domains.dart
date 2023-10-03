import 'package:demo_connect/home_screen.dart';
import 'package:demo_connect/internships/intern_consult/internship_consulting.dart';
import 'package:demo_connect/internships/intern_core/internship_core.dart';
import 'package:demo_connect/internships/intern_data/internship_data.dart';
import 'package:demo_connect/internships/intern_tech/internship_tech.dart';
import 'package:flutter/material.dart';
import '../common/scaffold_key.dart';
import '../widgets/domain_card.dart';
import 'intern_finance&mgmt/internship_fnm.dart';

class InternshipDomains extends StatefulWidget {
  const InternshipDomains({super.key});

  @override
  State<InternshipDomains> createState() => _InternshipDomainsState();
}

class _InternshipDomainsState extends State<InternshipDomains> {
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
                child: Domains(
                  domainName: 'IT/Tech',
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TechInternship(),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              GestureDetector(
                child: Domains(
                  domainName: 'Data Science',
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataInternship(),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              GestureDetector(
                child: Domains(
                  domainName: 'Consulting',
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConsultingInternship(),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              GestureDetector(
                child: Domains(domainName: 'Core'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CoreInternship(),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              GestureDetector(
                child: Domains(
                  domainName: 'Finance and Management',
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FnMInternship(),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              Domains(domainName: 'Post Graduation'),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              Domains(domainName: 'Post Graduation'),
            ],
          ),
        ],
      ),
    );
  }
}