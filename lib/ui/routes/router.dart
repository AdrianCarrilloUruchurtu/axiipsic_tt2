import 'package:auto_route/annotations.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view/login_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/paciente/home/patient_home_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/psicologo/home/psic_home_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/psicologo/list_page.dart';
import '../pages/auth/view/register_page.dart';
import '../pages/usuarios/view/profile_page.dart';
import 'guest_guard.dart';
import 'ispsic_guard.dart';

   
@MaterialAutoRouter(              
  replaceInRouteName: 'Page,Route',              
  routes: <MaterialRoute>[              
    MaterialRoute(page: LoginPage, initial: true, guards:[CheckIfUserIsGuest]),
      MaterialRoute(page: RegisterPage),
    MaterialRoute(page: PsicHomePage, guards:[CheckIfUserIsPsic],children: [
      MaterialRoute(page: ProfilePage), 
    ]), 
    MaterialRoute(page: PatHomePage, guards: [CheckIfUserIsPsic], children: [
      MaterialRoute(page: ProfilePage), 
      MaterialRoute(page: ListPage), 
    ]),              
  ],              
)              

class $AppRouter {}  