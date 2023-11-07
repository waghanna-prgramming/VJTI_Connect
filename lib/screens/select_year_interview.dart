import 'package:demo_connect/screens/selected_year_pdfs.dart';
import 'package:flutter/material.dart';
import '../widgets/domain_card.dart';
import 'category_screen.dart';

class SelectYearInterview extends StatefulWidget {
  final String domain, drive, title, domainID, driveID, companyName;
  final Map<int, Map<String, String>> companyData;
  const SelectYearInterview({
    super.key,
    required this.drive,
    required this.driveID,
    required this.domain,
    required this.domainID,
    required this.title,
    required this.companyData,
    required this.companyName,
  });

  @override
  State<SelectYearInterview> createState() => _SelectYearInterviewState();
}

class _SelectYearInterviewState extends State<SelectYearInterview> {
  @override
  Widget build(BuildContext context) {
    List<int> yearList = widget.companyData.keys.toList();

    return Scaffold(
      backgroundColor: Color(0xFF4F4F5B),
      // key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF4F4F5B),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
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
                widget.companyName,
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
              itemCount: yearList.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      child: DomainCard(
                        domainName: yearList[index].toString(),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectedYearPDFs(
                                drive: widget.drive,
                                domain: widget.domain,
                                driveID: widget.driveID,
                                domainID: widget.domainID,
                                dataMap: widget.companyData[yearList[index]],
                                year: yearList[index].toString(),
                                title: widget.title),
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
