import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ResumeProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<int, Map<String, String>> dataMap = {};

  fetchResume(
      {required String drive,
      required String domain,
      required String driveID,
      required String domainID}) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection(drive)
        .doc(driveID)
        .collection(domain)
        .doc(domainID)
        .collection('ResumeRepo')
        .orderBy('year')
        .get();
    List<DocumentSnapshot> documents = querySnapshot.docs;
    print(
        'Drive ID: $driveID and Domain ID: $domainID and Domain: $domain and Drive: $drive');

    for (var doc in documents) {
      int year = doc['year'];
      String name = doc['name'];
      String resume = doc['resume'];

      if (!dataMap.containsKey(year)) {
        dataMap[year] = {};
      }
      dataMap[year]![name] = resume;
    }

    // print(dataMap);
    notifyListeners();
  }

  Map<int, Map<String, String>> get getResume {
    return dataMap;
  }

  printResume() {
    dataMap.forEach((key, value) {
      print('Year: $key');
      value.forEach((name, link) {
        print('  Name: $name, Link: $link');
      });
    });
  }
}
