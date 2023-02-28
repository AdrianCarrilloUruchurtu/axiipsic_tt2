import 'package:axiipsic_tt2/ui/pages/auth/view/login_page.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view/register_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/paciente/home/patient_home_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/paciente/progress_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/psicologo/home/psic_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_state.dart';

class PageRouter extends StatelessWidget {
  const PageRouter({Key? key}) : super(key: key);

  // Poner logica de que usuario esta loggeado aqui

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginState>(
      create: (BuildContext context) => LoginState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          "login": (BuildContext context) {
            var state = context.watch<LoginState>();
            if (state.isLoggedIn()) {
              return const PatHomePage();
            } else {
              return Login();
            }
          },
          '/patHome': (BuildContext context) => const PatHomePage(),
          '/register': (BuildContext context) => RegisterPage(),
          '/psicHome': (BuildContext context) => PsicHomePage(),
          '/progressPage': (BuildContext context) => ProgressPage(),
        },
      ),
    );
  }
}
