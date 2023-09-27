import 'package:demo_connect/internships/internship_domains.dart';
import 'package:demo_connect/placements/placement_domains.dart';
import 'package:demo_connect/widgets/homescreen_cards.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
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
                            child: HomeScreenCard(input: 'Internships',),
                            onTap: () => Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context) => InternshipDomains(),
                            ),
                            ),
                          ),
                          height: 140,
                        ),
                        SizedBox.fromSize(
                          size: Size(20.0, 15.0),
                        ),
                        SizedBox(child: GestureDetector(child: HomeScreenCard(input: 'Placements',), onTap: () => Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => PlacementDomains(),
                        ),
                        ),), height: 140,),
                        SizedBox.fromSize(
                          size: Size(20.0, 15.0),
                        ),
                        SizedBox(child: HomeScreenCard(input: 'Website',), height: 140,),
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
