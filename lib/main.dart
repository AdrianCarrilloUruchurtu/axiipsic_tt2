import 'package:axiipsic_tt2/ui/routes/app.dart';
import 'package:axiipsic_tt2/ui/routes/router.gr.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => runApp(App()));
}