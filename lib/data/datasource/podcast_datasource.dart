import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class PodCastDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  String state = '';
  String get stateUpload => state;

  Future setImage({required String name, required Uint8List fileBytes}) async {
    final postImageRef = _storage.ref("Img");
    late String state;
    final UploadTask uploadTask = postImageRef
        .child("${DateTime.now().millisecondsSinceEpoch}.jpeg")
        .putData(
            fileBytes,
            SettableMetadata(
              contentType: 'image/jpeg',
            ));
    return await (await uploadTask).ref.getDownloadURL();
  }

  Future setAudio({required String name, required Uint8List fileBytes}) async {
    try {
      final postImageRef = _storage.ref("PodCas");
      late String state;
      final UploadTask uploadTask = postImageRef
          .child("${DateTime.now().millisecondsSinceEpoch}.mp3")
          .putData(
              fileBytes,
              SettableMetadata(
                contentType: 'audio/mpeg',
              ));
      return await (await uploadTask).ref.getDownloadURL();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future setPodCast(
      {required String name,
      required String urlImage,
      required String urlAudio,
      required String author}) async {
    try {
      await _firestore.collection("Recomendations").doc().set({
        "description": "",
        "id": "",
        "img": urlImage,
        "name": name,
        "podcast": urlAudio,
        "type": "PODCAST",
        "update": DateFormat("d  MMM  yyyy").format(DateTime.now()),
        "author": author
      }, SetOptions(merge: true));
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getAllPodcast() async {
    try {
      final resp = await _firestore.collection("Recomendations").get();
      return resp.docs;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> deletePodcast(String id) async {
    try {
      await _firestore.collection("Recomendations").doc(id).delete();
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }
}
