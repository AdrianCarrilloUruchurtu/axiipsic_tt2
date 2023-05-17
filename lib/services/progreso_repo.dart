import 'package:axiipsic_tt2/ui/pages/usuarios/view/progreso/model/progreso_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProgresoRepo {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<ProgresoData?> get(String id) async {
    final currentUser = _auth.currentUser;
    final uid = await _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('progreso')
        .doc(id)
        .get();
    final jsonUid = uid.data();
    if (jsonUid != null) {
      return ProgresoData.fromJson({...jsonUid, id: uid.id});
    } else {
      return null;
    }
  }

  Stream<List<ProgresoData>> progresoChanges(String id) {
    final currentUser = _auth.currentUser;
    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('sesiones')
        .doc(id)
        .collection('progreso')
        .snapshots()
        .map((event) {
      return event.docs.map((e) => ProgresoData.fromDocument(e)).toList();
    });
  }

  Future<DocumentReference<Map<String, dynamic>>> progresAdd(
      int colorId,
      String conducta,
      List<double?> lunes,
      List<double?> martes,
      List<double?> miercoles,
      List<double?> jueves,
      List<double?> viernes,
      List<double?> sabado,
      List<double?> domingo,
      String sesId,
      String pacienteId,
      pacienteSesId) {
    final currentUser = _auth.currentUser;

    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('sesiones')
        .doc(sesId)
        .collection('progreso')
        .add({
      'colorId': colorId,
      'userId': currentUser.uid,
      'conducta': conducta,
      "lunes": lunes,
      'martes': martes,
      "miercoles": miercoles,
      'jueves': jueves,
      "viernes": viernes,
      'sabado': sabado,
      'domingo': domingo
    }).then((value) {
      return _firestore
          .collection('users')
          .doc(pacienteId)
          .collection('sesiones')
          .doc(pacienteSesId)
          .collection('progreso')
          .add({
        'colorId': colorId,
        'userId': currentUser.uid,
        'conducta': conducta,
        "lunes": lunes,
        'martes': martes,
        "miercoles": miercoles,
        'jueves': jueves,
        "viernes": viernes,
        'sabado': sabado,
        'domingo': domingo
      });
    });
  }

  Future<DocumentReference<Map<String, dynamic>>> progresAddPac(
      int colorId,
      String conducta,
      List<double?> lunes,
      List<double?> martes,
      List<double?> miercoles,
      List<double?> jueves,
      List<double?> viernes,
      List<double?> sabado,
      List<double?> domingo,
      String sesId,
      String psicId,
      String psicSesId) {
    final currentUser = _auth.currentUser;

    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('sesiones')
        .doc(sesId)
        .collection('progreso')
        .add({
      'colorId': colorId,
      'userId': currentUser.uid,
      'conducta': conducta,
      "lunes": lunes,
      'martes': martes,
      "miercoles": miercoles,
      'jueves': jueves,
      "viernes": viernes,
      'sabado': sabado,
      'domingo': domingo
    }).then((value) {
      return _firestore
          .collection('users')
          .doc(psicId)
          .collection('sesiones')
          .doc(psicSesId)
          .collection('progreso')
          .add({
        'colorId': colorId,
        'userId': currentUser.uid,
        'conducta': conducta,
        "lunes": lunes,
        'martes': martes,
        "miercoles": miercoles,
        'jueves': jueves,
        "viernes": viernes,
        'sabado': sabado,
        'domingo': domingo
      });
    });
  }

  Future<void> editProgreso(
      String conducta,
      List<double?> lunes,
      List<double?> martes,
      List<double?> miercoles,
      List<double?> jueves,
      List<double?> viernes,
      List<double?> sabado,
      List<double?> domingo,
      String sesId,
      String pacienteId,
      String pacienteSesId,
      String conductaId,
      String conductaPacId) {
    final currentUser = _auth.currentUser;

    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('sesiones')
        .doc(sesId)
        .collection('progreso')
        .doc(conductaId)
        .update({
      'conducta': conducta,
      "lunes": lunes,
      'martes': martes,
      "miercoles": miercoles,
      'jueves': jueves,
      "viernes": viernes,
      'sabado': sabado,
      'domingo': domingo
    }).then((value) {
      return _firestore
          .collection('users')
          .doc(pacienteId)
          .collection('sesiones')
          .doc(pacienteSesId)
          .collection('progreso')
          .doc(conductaPacId)
          .update({
        'conducta': conducta,
        "lunes": lunes,
        'martes': martes,
        "miercoles": miercoles,
        'jueves': jueves,
        "viernes": viernes,
        'sabado': sabado,
        'domingo': domingo
      });
    });
  }

  Future<void> editProgresoPac(
      String conducta,
      List<double?> lunes,
      List<double?> martes,
      List<double?> miercoles,
      List<double?> jueves,
      List<double?> viernes,
      List<double?> sabado,
      List<double?> domingo,
      String sesId,
      String psicId,
      String psicSesId,
      String conductaId,
      String psicConductaId) {
    final currentUser = _auth.currentUser;

    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('sesiones')
        .doc(sesId)
        .collection('progreso')
        .doc(conductaId)
        .update({
      'conducta': conducta,
      "lunes": lunes,
      'martes': martes,
      "miercoles": miercoles,
      'jueves': jueves,
      "viernes": viernes,
      'sabado': sabado,
      'domingo': domingo
    }).then((value) {
      return _firestore
          .collection('users')
          .doc(psicId)
          .collection('sesiones')
          .doc(psicSesId)
          .collection('progreso')
          .doc(psicConductaId)
          .update({
        'conducta': conducta,
        "lunes": lunes,
        'martes': martes,
        "miercoles": miercoles,
        'jueves': jueves,
        "viernes": viernes,
        'sabado': sabado,
        'domingo': domingo
      });
    });
  }

  Future<void> deleteProgreso(String id) {
    //No funciona 😭
    final currentUser = _auth.currentUser;

    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('sesiones')
        .doc(id)
        .delete();
  }
}
