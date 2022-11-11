import 'package:cloud_firestore/cloud_firestore.dart';

class SearchDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getQueryForEmail(String email) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> list = await _firestore
          .collection("Users")
          .where("email", isEqualTo: email)
          .get();
      return list.docs;
    } catch (e) {
      throw Exception(e);
    }
  }
}
