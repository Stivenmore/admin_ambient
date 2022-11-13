import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:admin_ambient/domain/services/prefs_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admin_ambient/domain/models/user_model.dart' as model;

class AutenticationDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final prefs = UserPreferences();
  UserModel? userModel;
  String get userUid => _firebaseAuth.currentUser!.uid;
  bool isLoadingGetUser = false;

  bool get isAuth =>
      _firebaseAuth.currentUser != null &&
      _firebaseAuth.currentUser?.uid != null;

  Future<Map<String, dynamic>> login(
      {required String email, required String password}) async {
    try {
      final user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user.user!.uid.isNotEmpty) {
        final usercloud =
            await _firestore.collection('Manager').doc(user.user!.uid).get();
        if (usercloud.exists) {
          prefs.token = usercloud.id;
          userModel = UserModel.fromFirebase(usercloud.data()!);
          return {"bool": true, "message": ""};
        } else {
          return {"bool": false, "message": "Usuario no encontrado"};
        }
      } else {
        return {"bool": false, "message": "Usuario no encontrado"};
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> register(
      {required String email,
      required String password,
      required String fullname}) async {
    try {
      isLoadingGetUser = true;
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (credentials.user!.uid != '') {
        await _firestore.collection('Manager').doc(credentials.user!.uid).set({
          'email': email,
          'name': fullname,
          'password': password,
        });
        prefs.token = credentials.user!.uid;
        userModel = UserModel.fromFirebase({
          "name": fullname,
          "email": email,
        });
        isLoadingGetUser = false;
        return {"bool": true, "message": ""};
      } else {
        isLoadingGetUser = false;
        return {"bool": false, "message": "Usuario no encontrado"};
      }
    } catch (e) {
      isLoadingGetUser = false;
      throw Exception(e);
    }
  }

  Future<bool> forget({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(message: e.message, code: e.code);
    }
  }

  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      prefs.token = "";
      userModel = UserModel(
          nombre: "",
          email: "",
          transaction: <model.Transaction>[],
          recycler: <RecyclerModel>[]);
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map> getUser(String uid) async {
    try {
      final usercloud = await _firestore.collection('Manager').doc(uid).get();
      if (usercloud.exists) {
        userModel = UserModel.fromFirebase(usercloud.data()!);
        return {"bool": true, "message": ""};
      } else {
        return {"bool": false, "message": "Usuario no encontrado"};
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
