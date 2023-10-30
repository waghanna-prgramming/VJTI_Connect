// import 'package:flutter/material.dart';
import 'package:demo_connect/providers/courses_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'category_screen.dart';

class ImpCourses extends StatefulWidget {
  // const ImpCourses({Key? key}) : super(key: key);
  final String domain, drive, title, domainID, driveID;
  const ImpCourses(
      {required this.domain,
      required this.domainID,
      required this.drive,
      required this.driveID,
      required this.title});

  @override
  State<ImpCourses> createState() => _ImpCoursesState();
}

class _ImpCoursesState extends State<ImpCourses> {
  late CoursesProvider coursesProvider;

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    CoursesProvider coursesProvider = Provider.of(context, listen: false);
    coursesProvider.fetchCourses(
        drive: widget.drive,
        domain: widget.domain,
        driveID: widget.driveID,
        domainID: widget.domainID);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    coursesProvider = Provider.of(context);
    Map<String, String> courses = coursesProvider.getCourses;
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F4F8),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF14181B),
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => CategoryPage(
                    drive: widget.drive,
                    driveID: widget.driveID,
                    domain: widget.domain,
                    domainID: widget.domainID,
                    title: widget.title),
              ),
            );
          },
        ),
        centerTitle: true,
        title: Text('Important Courses'),
        titleTextStyle: TextStyle(
          fontFamily: 'Sora',
          color: Color(0xFF14181B),
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        actions: [],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (BuildContext context, int index) {
          String content = courses.keys.elementAt(index);
          String? link = courses[content];
          return ListTile(
            title: Text(content),
            leading: Icon(Icons.book),
            trailing: link != "na" ? Icon(Icons.arrow_forward) : null,
            onTap: () {
              link != "na" ? _launchUrl(Uri.parse(link!)) : null;
            },
          );
        },
      ),
    );
  }
}
