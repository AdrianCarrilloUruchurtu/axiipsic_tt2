import 'package:auto_route/annotations.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view/login_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/paciente/home/patient_home_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/psicologo/home/psic_home_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/psicologo/list_page.dart';
import 'package:flutter/cupertino.dart';
import '../pages/auth/view/register_page.dart';
import '../pages/usuarios/view/profile_page.dart';

   
@MaterialAutoRouter(              
  replaceInRouteName: 'Page,Route',              
  routes: <MaterialRoute>[              
    MaterialRoute(page: Login, initial: true),              
    MaterialRoute(page: PatHomePage),              
    MaterialRoute(page: PsicHomePage),              
    MaterialRoute(page: ProfilePage),              
    MaterialRoute(page: RegisterPage),
    MaterialRoute(page: ListPage),                
  ],              
)              

class $AppRouter {}  