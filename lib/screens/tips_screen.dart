import 'package:demo_connect/providers/tips_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category_screen.dart';

class GeneralTips extends StatefulWidget {
  final String domain, drive, title, domainID, driveID;
  const GeneralTips(
      {required this.domain,
      required this.domainID,
      required this.drive,
      required this.driveID,
      required this.title});

  @override
  State<GeneralTips> createState() => _GeneralTipsState();
}

class _GeneralTipsState extends State<GeneralTips> {
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
    List<String> tips = tipsProvider.getTips;
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
        title: Text('General Tips'),
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
        itemCount: tips.length,
        itemBuilder: (BuildContext context, int index) {
          String content = tips[index];
          return ListTile(
            title: Text(content),
            leading: Icon(Icons.star),
          );
        },
      ),
    );
  }
}
