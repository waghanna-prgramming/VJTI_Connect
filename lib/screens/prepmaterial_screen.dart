import 'package:demo_connect/providers/prep_material_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'category_screen.dart';

class PrepMaterial extends StatefulWidget {
  final String domain, drive, title, domainID, driveID;
  const PrepMaterial(
      {required this.domain,
      required this.domainID,
      required this.drive,
      required this.driveID,
      required this.title});
  // const PrepMaterial({Key? key}) : super(key: key);

  @override
  State<PrepMaterial> createState() => _PrepMaterialState();
}

class _PrepMaterialState extends State<PrepMaterial> {
  late PrepMaterialProvider prepMaterialProvider;

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    PrepMaterialProvider prepMaterialProvider =
        Provider.of(context, listen: false);
    prepMaterialProvider.fetchPrepMaterial(
        drive: widget.drive,
        domain: widget.domain,
        driveID: widget.driveID,
        domainID: widget.domainID);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    prepMaterialProvider = Provider.of(context);
    Map<String, String> preparationMaterials =
        prepMaterialProvider.getPrepMaterial;
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
        title: Text('Prep Material'),
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
        itemCount: preparationMaterials.length,
        itemBuilder: (BuildContext context, int index) {
          String content = preparationMaterials.keys.elementAt(index);
          String? link = preparationMaterials[content];
          return ListTile(
            title: Text(content),
            leading: Icon(Icons.library_books),
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
