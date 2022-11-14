import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

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

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getActiveteTrue() async {
    try {
      final resp = await _firestore
          .collection("Users")
          .where("activate", isEqualTo: true)
          .get();
      return resp.docs;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future setUserTypeDown(String id) async {
    try {
      await _firestore
          .collection("Users")
          .doc(id)
          .set({"activate": false}, SetOptions(merge: true));
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future setVisitHome(
      {required UserModel user,
      required UserModel manager,
      required String reasen}) async {
    try {
      await _firestore.collection("VisitHome").doc().set({
        "user_name": user.nombre,
        "user_address": user.address,
        "user_phone": user.phone,
        "time_manager": DateFormat('yyyy-MM-dd').format(DateTime.now()),
        "manager_name": manager.nombre,
        "reasen": reasen
      }, SetOptions(merge: true));
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }
}
