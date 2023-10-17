import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_connect/widgets/domain_card.dart';
import 'package:flutter/material.dart';

class ResumePage extends StatefulWidget {
  @override
  _ResumePageState createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<String> years = [
    '2019',
    '2020',
    '2021',
    '2022',
    '2023'
  ]; // Add more years as needed
  Map<String, List<DocumentSnapshot>> dataMap = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    // for (String year in years) {
    //   QuerySnapshot querySnapshot = await _firestore.collection(year).get();
    //   List<DocumentSnapshot> documents = querySnapshot.docs;
    //   dataMap[year] = documents;
    // }
    // QuerySnapshot querySnapshot = await _firestore.listCollections();
    // for (var collection in querySnapshot.docs) {
    //   String year = collection.id;
    //   QuerySnapshot yearSnapshot = await collection.reference.get();
    //   List<DocumentSnapshot> documents = yearSnapshot.docs;
    //   dataMap[year] = documents;
    // }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resumes'),
      ),
      body: ListView.builder(
        itemCount: years.length,
        itemBuilder: (context, index) {
          String year = years[index];
          List<DocumentSnapshot> documents = dataMap[year] ?? [];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  year,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: documents.length >= 3 ? 3 : documents.length,
                itemBuilder: (context, docIndex) {
                  // Implement the UI for each document here
                  // Use InkWell or GestureDetector for clickable links
                  return DomainCard(
                    domainName: documents[docIndex]['name'],
                    // title: Text(documents[docIndex]['name']),
                    // onTap: () {
                    // Implement the functionality to show the PDF here
                    // },
                  );
                },
              ),
              if (documents.length > 3)
                TextButton(
                  onPressed: () {
                    // Implement the functionality to navigate to the new page with all the resumes of that year
                  },
                  child: Text('View More'),
                ),
            ],
          );
        },
      ),
    );
  }
}
