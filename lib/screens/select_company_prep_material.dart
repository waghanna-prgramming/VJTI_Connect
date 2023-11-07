import 'package:demo_connect/providers/prep_material_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/domain_card.dart';
import 'category_screen.dart';
import 'list_tile_screen.dart';

class SelectCompanyPrepMaterial extends StatefulWidget {
  final String domain, drive, title, domainID, driveID;
  const SelectCompanyPrepMaterial(
      {required this.domain,
      required this.domainID,
      required this.drive,
      required this.driveID,
      required this.title});
  // const PrepMaterial({Key? key}) : super(key: key);

  @override
  State<SelectCompanyPrepMaterial> createState() =>
      _SelectCompanyPrepMaterialState();
}

class _SelectCompanyPrepMaterialState extends State<SelectCompanyPrepMaterial> {
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
    Map<String, Map<String, String>> preparationMaterials =
        prepMaterialProvider.getPrepMaterial;
    List<String> companyNames = preparationMaterials.keys.toList();
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
          SizedBox(
            height: 10,
          ),
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
          Expanded(
            child: ListView.builder(
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
                              companyMaterial:
                                  preparationMaterials[companyNames[index]]!,
                              title: widget.title,
                              titleForListTileScreen: 'Prep Material',
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
