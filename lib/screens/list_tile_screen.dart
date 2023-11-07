import 'package:demo_connect/screens/select_company_prep_material.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListTileScreen extends StatefulWidget {
  final String domain, drive, title, domainID, driveID, titleForListTileScreen;
  final Map<String, String> companyMaterial;
  const ListTileScreen({
    super.key,
    required this.domain,
    required this.domainID,
    required this.drive,
    required this.driveID,
    required this.title,
    required this.companyMaterial,
    required this.titleForListTileScreen,
  });

  @override
  State<ListTileScreen> createState() => _ListTileScreenState();
}

class _ListTileScreenState extends State<ListTileScreen> {
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                builder: (context) => SelectCompanyPrepMaterial(
                    drive: widget.drive,
                    driveID: widget.driveID,
                    domain: widget.domain,
                    domainID: widget.domainID,
                    title: widget.title),
              ),
            );
          },
        ),
        actions: const [],
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 170, 0),
            child: Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Text(
                widget.titleForListTileScreen,
                style: TextStyle(
                  fontFamily: 'Sora',
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.companyMaterial.length,
              itemBuilder: (BuildContext context, int index) {
                String content = widget.companyMaterial.keys.elementAt(index);
                String? link = widget.companyMaterial[content];
                return ListTile(
                  title: Text(content, style: TextStyle(
                    color: Colors.white,
                  ),),
                  leading: const Icon(Icons.library_books, color: Colors.white,),
                  trailing: link != "na" ? const Icon(Icons.arrow_forward, color: Colors.white,) : null,
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
