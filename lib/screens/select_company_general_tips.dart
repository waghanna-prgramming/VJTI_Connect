import 'package:demo_connect/providers/tips_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/domain_card.dart';
import 'category_screen.dart';
import 'list_tile_screen.dart';

class SelectCompanyGenTips extends StatefulWidget {
  // const SelectCompanyGenTips({Key? key}) : super(key: key);

  final String domain, drive, title, domainID, driveID;
  const SelectCompanyGenTips(
      {super.key,
      required this.domain,
      required this.domainID,
      required this.drive,
      required this.driveID,
      required this.title});

  @override
  State<SelectCompanyGenTips> createState() => _SelectCompanyGenTipsState();
}

class _SelectCompanyGenTipsState extends State<SelectCompanyGenTips> {
  late TipsProvider tipsProvider;

  @override
  void initState() {
    // TODO: implement initState
    TipsProvider tipsProvider = Provider.of(context, listen: false);
    tipsProvider.fetchTips(
        drive: widget.drive,
        domain: widget.domain,
        driveID: widget.driveID,
        domainID: widget.domainID);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tipsProvider = Provider.of(context);
    Map<String, Map<String, String>> tips = tipsProvider.getTips;
    List<String> companyNames = tips.keys.toList();
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
                'General Tips',
                style: TextStyle(
                  fontFamily: 'Sora',
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
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
                              companyMaterial: tips[companyNames[index]]!,
                              title: widget.title,
                              titleForListTileScreen: 'Tips',
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
