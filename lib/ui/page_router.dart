import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view/login_page.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view/register_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/profile_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/paciente/home/patient_home_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/paciente/progress_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/psicologo/home/psic_home_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/psicologo/list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_state.dart';

// class PageRouter extends StatelessWidget {
//   const PageRouter({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<LoginState>(
//       create: (BuildContext context) => LoginState(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         initialRoute: 'login',
//         routes: {
//           "login": (BuildContext context) {
//             var state = context.watch<LoginState>();
//             if (state.isLoggedIn()) {
//               return const PatHomePage();
//             } else {
//               return const Login();
//             }
//           },
//           '/patHome': (BuildContext context) => const PatHomePage(),
//           '/profilePage': (BuildContext context) => ProfilePage(),
//           '/register': (BuildContext context) => RegisterPage(),
//           '/psicHome': (BuildContext context) => const PsicHomePage(),
//           '/progressPage': (BuildContext context) => ProgressPage(),
//           '/listPage': (BuildContext context) => ListPage(),
//         },
//       ),
//     );
//   }
// }

              
// @CupertinoAutoRouter              
// @AdaptiveAutoRouter              
// @CustomAutoRouter              
@MaterialAutoRouter(              
  replaceInRouteName: 'Page,Route',              
  routes: <AutoRoute>[              
    AutoRoute(page: Login, initial: true),              
    AutoRoute(page: PatHomePage),              
    AutoRoute(page: ProfilePage),              
    AutoRoute(page: RegisterPage),
    AutoRoute(page: ListPage),                
  ],              
)              
class $AppRouter {}  