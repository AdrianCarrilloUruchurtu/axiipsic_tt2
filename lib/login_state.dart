import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginState with ChangeNotifier {
  bool _loggedIn = false;

  bool isLoggedIn() => _loggedIn;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user;
  User currentUser() => _user;

  void login() async {
    _user = (await _handleSignIn())!;
    if (_user != null) {
      _loggedIn = true;
      notifyListeners();
    }else {
      _loggedIn = false;
    }
    _loggedIn = true;
    notifyListeners();
  }

  void logout() {
    _googleSignIn.signOut();
    _loggedIn = false;
    notifyListeners();
  }


  Future<User?> _handleSignIn() async{
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    ) ;

    final UserCredential result = (await _auth.signInWithCredential(credential) );
    User? user = result.user;
    print(user?.displayName);
    return user;

  }

}