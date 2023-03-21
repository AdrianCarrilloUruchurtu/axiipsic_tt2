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
      Timestamp date, String title, String description) {
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

  //pedir ayuda a proclo
  Future<QuerySnapshot<Object?>> loadEvent(
      DateTime focusedDay, Map<DateTime, List<CalendarData>> events) async {
    final firstDay = DateTime(focusedDay.year, focusedDay.month, 1);
    final lastDay = DateTime(focusedDay.year, focusedDay.month + 1, 0);
    final currentUSer = _auth.currentUser;
    events = {};

    final snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUSer?.uid)
        .collection('calendar')
        .where('date', isGreaterThanOrEqualTo: firstDay)
        .where('date', isLessThanOrEqualTo: lastDay)
        // .withConverter(
        //     fromFirestore: Event.fromFirestore,
        //     toFirestore: (event, options) => event?.toFirestore())
        .get();

    for (var doc in snap.docs) {
      final event = doc.data();
      final day = firstDay;
      //DateTime.utc(event!.date.year, event.date.month, event.date.day); que no funciona como debería????
      if (events[day] == null) {
        events[day] = [];
      }
      // events[day]!.add(event); Preguntar pq no funciona tmbn
    }

    return snap;
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
