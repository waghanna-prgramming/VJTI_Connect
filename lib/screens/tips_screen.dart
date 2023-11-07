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
            padding: EdgeInsets.fromLTRB(20, 0, 130, 0),
            child: Text(
              'General Tips',
              style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tips.length,
              itemBuilder: (BuildContext context, int index) {
                String content = tips[index];
                return ListTile(
                  title: Text(content,
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                  leading: Icon(Icons.star, color: Colors.white,),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
