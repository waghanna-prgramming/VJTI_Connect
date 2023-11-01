import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TipsProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, String> dataMap = {};

  fetchTips(
      {required String drive,
      required String domain,
      required String driveID,
      required String domainID}) async {
    dataMap.clear();
    QuerySnapshot querySnapshot = await _firestore
        .collection(drive)
        .doc(driveID)
        .collection(domain)
        .doc(domainID)
        .collection('GeneralTips')
        .get();
    List<DocumentSnapshot> documents = querySnapshot.docs;

    for (var doc in documents) {
      dataMap[doc['tip']] = "";
    }

    notifyListeners();
  }

  List<String> get getTips {
    return dataMap.keys.toList();
  }
}
