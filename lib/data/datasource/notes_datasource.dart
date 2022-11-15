import 'package:cloud_firestore/cloud_firestore.dart';

class NotesDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getAllNotes() async {
    try {
      final resp = await _firestore.collection("Recycler").get();
      return resp.docs;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future setNewNotes(String name, String problem, String description,
      String author, String urlImg, String time) async {
    try {
      await _firestore.collection("Recycler").doc().set({
        "Episode": [
          {
            "Options": [],
            "description": description,
            "name": name,
            "problem": problem
          }
        ],
        "creator": author,
        "description": "Informacion basica",
        "img": urlImg,
        "name": name,
        "time": time
      });
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future deleteNote(String id) async {
    try {
      await _firestore.collection("Recycler").doc(id).delete();
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }
}
