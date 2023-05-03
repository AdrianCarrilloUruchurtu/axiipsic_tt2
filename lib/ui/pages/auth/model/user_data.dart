import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  factory UserData(String nombre, String apellido, String ispsic, String email,
      String psicMail, String id) = _UserData;


  factory UserData.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) =>
      _$UserDataFromJson(
          {...?doc.data(), "id": doc.id, "psicMail": (doc.get("psicMail"))});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
