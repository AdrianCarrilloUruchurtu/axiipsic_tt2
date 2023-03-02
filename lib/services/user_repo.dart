// Obtener uno, todos, crear uno
import 'package:axiipsic_tt2/ui/pages/auth/model/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<UserData?> get(String id) async {
    final uid = await _firestore.collection('users').doc(id).get();
    final jsonUid = uid.data();
    if (jsonUid != null) {
      return UserData.fromJson(jsonUid);
    } else {
      return null;
    }
  }
}
