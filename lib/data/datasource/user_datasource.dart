import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<int> getConfig() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> list =
          await _firestore.collection("Config").get();
      return list.docs[0].data()["pricepoint"];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future setRecycler(String id, List<Map<String, dynamic>> map) async {
    try {
      await _firestore
          .collection("Users")
          .doc(id)
          .set({"recycler": map}, SetOptions(merge: true));
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future setPoint(String id, List<Map<String, dynamic>> map) async {
    try {
      await _firestore
          .collection("Users")
          .doc(id)
          .set({"pointList": map}, SetOptions(merge: true));
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }
}
