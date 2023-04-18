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
      Timestamp date, String title, String description, String time) {
    final currentUser = _auth.currentUser;

    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('calendar')
        .add({
      'userId': currentUser.uid,
      'title': title,
      "date": date,
      "description": description,
      "time": time
    });
  }

  Future<void> deleteEvent(String id) async {
    final currentUser = _auth.currentUser;
    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('calendar')
        .doc(id)
        .delete();
  }

  // Obsoleto ¿?
  Future<List<CalendarData>> loadEvent() async {
    final currentUSer = _auth.currentUser;

    final snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUSer?.uid)
        .collection('calendar')
        .get();

    return snap.docs.map((e) => CalendarData.fromDocument(e)).toList();
  }

  Stream<List<CalendarData>> calendarChanges() {
    final currentUser = _auth.currentUser;
    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('calendar')
        .snapshots()
        .map((event) {
      return event.docs.map((e) => CalendarData.fromDocument(e)).toList();
    });
  }
}
