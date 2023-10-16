import 'package:demo_connect/screens/domain_page.dart';
import 'package:demo_connect/widgets/homescreen_cards.dart';
// import 'package:demo_connect/widgets/homescreen_cardsrial.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Uri _url = Uri.parse(
      'https://vjti.ac.in/training-and-placement-office-vjti-mumbai/');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F4F8),
        appBar: AppBar(
          backgroundColor: Color(0xFFF1F4F8),
          automaticallyImplyLeading: false,
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Text(
                      'VJTI Connect',
                      style: TextStyle(
                        fontFamily: 'Sora',
                        color: Color(0xFF14181B),
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox.fromSize(
                          size: Size(20.0, 15.0),
                        ),
                        SizedBox(
                          child: GestureDetector(
                            child: HomeScreenCard(
                              input: 'Internships',
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DomainPage(drive: 'internships'),
                              ),
                            ),
                          ),
                          height: 140,
                        ),
                        SizedBox.fromSize(
                          size: Size(20.0, 15.0),
                        ),
                        SizedBox(
                          child: GestureDetector(
                            child: HomeScreenCard(
                              input: 'Placements',
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DomainPage(drive: 'placements'),
                              ),
                            ),
                          ),
                          height: 140,
                        ),
                        SizedBox.fromSize(
                          size: Size(20.0, 15.0),
                        ),
                        SizedBox(
                          child: GestureDetector(
                            child: HomeScreenCard(
                              input: 'Website',
                            ),
                            onTap: _launchUrl,
                          ),
                          height: 140,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
