import 'package:axiipsic_tt2/ui/pages/usuarios/view/calendar/model/calendar_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@singleton
class CalendarRepo {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<CalendarData?> get(String id) async {
    final currentUser = _auth.currentUser;

    final uid = await _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('calendar')
        .doc(id)
        .get();

    final jsonUid = uid.data();
    if (jsonUid != null) {
      return CalendarData.fromJson({...jsonUid, id: uid.id});
    } else {
      return null;
    }
  }


    Future<DocumentReference<Map<String, dynamic>>> addEvent(
      String date, String title, String description) {
    final currentUSer = _auth.currentUser;

    return _firestore
        .collection('users')
        .doc(currentUSer!.uid)
        .collection('calendar')
        .add({
      'userId': currentUSer.uid,
      'title': title,
      "date": date,
      "description": description,
    });
  }
}
