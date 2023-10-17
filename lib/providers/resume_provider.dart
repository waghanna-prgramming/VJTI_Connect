import 'package:cloud_firestore/cloud_firestore.dart';

class ResumeProvider {
  final String drive, driveID, domain, domainID;

  ResumeProvider(
      {required this.drive,
      required this.domain,
      required this.driveID,
      required this.domainID});

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<String> years = [
    '2019',
    '2020',
    '2021',
    '2022',
    '2023'
  ]; // Add more years as needed
  Map<String, Map<String, String>> dataMap = {};

  fetchResume() async {
    QuerySnapshot querySnapshot = await _firestore
        .collection(drive)
        .doc(driveID)
        .collection(domain)
        .doc(domainID)
        .collection('ResumeRepo')
        .get();
    List<DocumentSnapshot> documents = querySnapshot.docs;

    for (DocumentSnapshot docs in documents) {
      // Map<String, String> mp = {};
      dataMap[docs['year']]!['name'] = docs['resume'];
    }
    // dataMap[year] = documents;
  }

  Map<String, Map<String, String>> get getResume {
    return dataMap;
  }
}
