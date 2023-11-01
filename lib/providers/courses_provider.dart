import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CoursesProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, String> dataMap = {};

  fetchCourses(
      {required String drive,
      required String domain,
      required String driveID,
      required String domainID}) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection(drive)
        .doc(driveID)
        .collection(domain)
        .doc(domainID)
        .collection('ImpCourses')
        .get();
    List<DocumentSnapshot> documents = querySnapshot.docs;

    dataMap.clear();

    for (var doc in documents) {
      String content = doc['content'];
      String link = doc['link'];

      dataMap[content] = link;
    }

    notifyListeners();
  }

  Map<String, String> get getCourses {
    return dataMap;
  }
}
