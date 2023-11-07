import 'package:demo_connect/common/heading.dart';
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
              'Preparation Material',
              style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: preparationMaterials.length,
              itemBuilder: (BuildContext context, int index) {
                String content = preparationMaterials.keys.elementAt(index);
                String? link = preparationMaterials[content];
                return ListTile(
                  title: Text(content, style: TextStyle(
                    color: Colors.white,
                  ),),
                  leading: Icon(Icons.library_books, color: Colors.white,),
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
