import 'package:demo_connect/providers/courses_provider.dart';
import 'package:demo_connect/screens/list_tile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/domain_card.dart';
import 'category_screen.dart';

class SelectCompanyImpCourses extends StatefulWidget {
  final String domain, drive, title, domainID, driveID;
  const SelectCompanyImpCourses(
      {super.key,
      required this.domain,
      required this.domainID,
      required this.drive,
      required this.driveID,
      required this.title});
  // const PrepMaterial({Key? key}) : super(key: key);

  @override
  State<SelectCompanyImpCourses> createState() =>
      _SelectCompanyImpCoursesState();
}

class _SelectCompanyImpCoursesState extends State<SelectCompanyImpCourses> {
  late CoursesProvider coursesProvider;

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
    Map<String, Map<String, String>> courses = coursesProvider.getCourses;
    List<String> companyNames = courses.keys.toList();
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
        title: const Text('Select Company'),
        titleTextStyle: const TextStyle(
          fontFamily: 'Sora',
          color: Color(0xFF14181B),
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        actions: const [],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: companyNames.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox.fromSize(
                size: const Size(20.0, 15.0),
              ),
              GestureDetector(
                child: DomainCard(
                  domainName: companyNames[index],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListTileScreen(
                        drive: widget.drive,
                        domain: widget.domain,
                        driveID: widget.driveID,
                        domainID: widget.domainID,
                        companyMaterial: courses[companyNames[index]]!,
                        title: widget.title,
                        titleForListTileScreen: 'Imp Courses',
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
