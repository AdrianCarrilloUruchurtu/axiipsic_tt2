import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/services/user_repo.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view_model/auth_mobx.dart';
import 'package:axiipsic_tt2/ui/routes/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  getIt.registerLazySingleton<UserRepo>(() => UserRepo());
  getIt.registerLazySingleton<AuthMobx>(() => AuthMobx());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => runApp(App()));
}
