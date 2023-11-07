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
        centerTitle: true,
        title: Text(widget.titleForListTileScreen),
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
        itemCount: widget.companyMaterial.length,
        itemBuilder: (BuildContext context, int index) {
          String content = widget.companyMaterial.keys.elementAt(index);
          String? link = widget.companyMaterial[content];
          return ListTile(
            title: Text(content),
            leading: const Icon(Icons.library_books),
            trailing: link != "na" ? const Icon(Icons.arrow_forward) : null,
            onTap: () {
              link != "na" ? _launchUrl(Uri.parse(link!)) : null;
            },
          );
        },
      ),
    );
  }
}
