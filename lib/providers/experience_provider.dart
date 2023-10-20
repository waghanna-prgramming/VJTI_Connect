import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ExperienceProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, Map<String, String>> dataMap = {};

  fetchExperience(
      {required String drive,
      required String domain,
      required String driveID,
      required String domainID}) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection(drive)
        .doc(driveID)
        .collection(domain)
        .doc(domainID)
        .collection('InterviewExp')
        .get();
    List<DocumentSnapshot> documents = querySnapshot.docs;

    for (var doc in documents) {
      String company = doc['company'];
      String name = doc['name'];
      String explink = doc['explink'];

      if (!dataMap.containsKey(company)) {
        dataMap[company] = {};
      }
      dataMap[company]![name] = explink;
    }

    // print(dataMap);
    notifyListeners();
  }

  List<String> get getCompanyNames {
    return dataMap.keys.toList();
  }

  Map<String, String>? getExperience(String companyName) {
    return dataMap[companyName];
  }
}
