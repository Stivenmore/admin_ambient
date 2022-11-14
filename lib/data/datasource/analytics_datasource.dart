import 'package:cloud_firestore/cloud_firestore.dart';

class AnalyticsDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getAllUserRegisterDay(String day) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> list = await _firestore
          .collection("Users")
          .where("dayregister", isEqualTo: day)
          .get();
      return list.docs;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getAllUserRegisterMonth(String month) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> list = await _firestore
          .collection("Users")
          .where("monthregister", isEqualTo: month)
          .get();
      return list.docs;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getAllUserRegisterYear(String year) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> list = await _firestore
          .collection("Users")
          .where("yearsregister", isEqualTo: year)
          .get();
      return list.docs;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getAllUserLastUpdateLogin(String time) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> list = await _firestore
          .collection("Users")
          .where("lastlogin", isEqualTo: time)
          .get();
      return list.docs;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> avaiblePodcast() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> list = await _firestore
          .collection("Recomendations")
          .where("type", isEqualTo: "PODCAST")
          .get();
      return list.docs.isNotEmpty;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> avaibleNotes() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> list =
          await _firestore.collection("Recycler").get();
      return list.docs.isNotEmpty;
    } catch (e) {
      throw Exception(e);
    }
  }
}
