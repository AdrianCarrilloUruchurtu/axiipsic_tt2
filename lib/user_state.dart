import 'package:axiipsic_tt2/ui/pages/auth/login_page.dart';
import 'package:axiipsic_tt2/ui/pages/paciente/home/patient_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserState extends StatelessWidget {
  const UserState({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, userSnapshot){
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }else if (userSnapshot.connectionState == ConnectionState.waiting){
            if (userSnapshot.hasData) {
             return PatHomePage();
            }else{
             return Login();
            }
          }else if (userSnapshot.hasError) {
            return Center(child: Text("Ocurrió un error"),);
          }
        });
  }
}
