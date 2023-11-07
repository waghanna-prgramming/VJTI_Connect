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
      backgroundColor: const Color(0xFF4F4F5B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4F4F5B),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
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
        actions: [],
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 80, 0),
            child: Text(
              'Important Courses',
              style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.white,
                fontSize: 33,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (BuildContext context, int index) {
                String content = courses.keys.elementAt(index);
                String? link = courses[content];
                return ListTile(
                  title: Text(content, style: TextStyle(
                    color: Colors.white,
                  ),),
                  leading: Icon(Icons.book, color: Colors.white,),
                  trailing: link != "na" ? Icon(Icons.arrow_forward, color: Colors.white,) : null,
                  onTap: () {
                    link != "na" ? _launchUrl(Uri.parse(link!)) : null;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
