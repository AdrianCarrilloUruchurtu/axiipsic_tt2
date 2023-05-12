import 'package:axiipsic_tt2/ui/pages/auth/view/login_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/paciente/home/patient_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserState extends StatelessWidget {
  const UserState({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (userSnapshot.connectionState == ConnectionState.waiting) {
            if (userSnapshot.hasData) {
              return const PatHomePage();
            } else {
              return const LoginPage();
            }
          } else if (userSnapshot.hasError) {
            return const Center(
              child: Text("Ocurrió un error"),
            );
          } else {
            return const Placeholder();
          }
        });
  }
}
