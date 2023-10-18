import 'package:demo_connect/providers/resume_provider.dart';
import 'package:demo_connect/screens/category_page.dart';
import 'package:demo_connect/widgets/domain_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

Widget resumeDisplay(int year, Map<String, String> yearDataMap) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              year.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'View All',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      Column(
        // children: yearDataMap.keys.map((name) {
        //   return DomainCard(domainName: name);
        // }).toList(),
        children: [
          DomainCard(domainName: "Tanmay Navandar"),
          DomainCard(domainName: "Siddhant Waghanna"),
          DomainCard(domainName: "Yash Chindhe"),
        ],
      ),
    ],
  );
}

class ResumeRepository extends StatefulWidget {
  final String domain, drive, title, domainID, driveID;
  const ResumeRepository(
      {required this.domain,
      required this.domainID,
      required this.drive,
      required this.driveID,
      required this.title});

  @override
  State<ResumeRepository> createState() => _ResumeRepositoryState();
}

class _ResumeRepositoryState extends State<ResumeRepository> {
  late ResumeProvider resumeProvider;

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    ResumeProvider resumeProvider = Provider.of(context, listen: false);
    resumeProvider.fetchResume(
        drive: widget.drive,
        domain: widget.domain,
        driveID: widget.driveID,
        domainID: widget.domainID);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("hey we are in resume repo");
    resumeProvider = Provider.of(context);
    Map<int, Map<String, String>> dataMap = resumeProvider.getResume;
    // print(dataMap);
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F8),
      // key: scaffoldKey,
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

      body: ListView.builder(
          itemCount: dataMap.length,
          itemBuilder: (context, index) {
            // print(dataMap[dataMap.keys.elementAt(index)]!);
            int year = dataMap.keys.elementAt(index);
            Map<String, String>? yearDataMap =
                dataMap[dataMap.keys.elementAt(index)];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        year.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'View All',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: yearDataMap!.keys.take(3).map((name) {
                    return GestureDetector(
                      child: DomainCard(domainName: name),
                      onTap: () {
                        _launchUrl(
                          Uri.parse(yearDataMap[name]!),
                        );
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  height: 1.0,
                ),
              ],
            );
          }),
    );
  }
}
