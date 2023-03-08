// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../pages/auth/view/login_page.dart' as _i1;
import '../pages/auth/view/register_page.dart' as _i8;
import '../pages/usuarios/view/notas/main_notas.dart' as _i7;
import '../pages/usuarios/view/paciente/home/patient_home_page.dart' as _i3;
import '../pages/usuarios/view/paciente/linea/view/ayuda_linea.dart' as _i6;
import '../pages/usuarios/view/paciente/progress/progress_page.dart' as _i5;
import '../pages/usuarios/view/profile_page.dart' as _i4;
import '../pages/usuarios/view/psicologo/home/psic_home_page.dart' as _i2;
import '../pages/usuarios/view/psicologo/list_page.dart' as _i9;
import 'guest_guard.dart' as _i12;
import 'ispat_guard.dart' as _i14;
import 'ispsic_guard.dart' as _i13;

class AppRouter extends _i10.RootStackRouter {
  AppRouter({
    _i11.GlobalKey<_i11.NavigatorState>? navigatorKey,
    required this.checkIfUserIsGuest,
    required this.checkIfUserIsPsic,
    required this.checkIfUserIsPat,
  }) : super(navigatorKey);

  final _i12.CheckIfUserIsGuest checkIfUserIsGuest;

  final _i13.CheckIfUserIsPsic checkIfUserIsPsic;

  final _i14.CheckIfUserIsPat checkIfUserIsPat;

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    PsicHomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.PsicHomePage(),
      );
    },
    PatHomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.PatHomePage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ProfilePage(),
      );
    },
    ProgressRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ProgressPage(),
      );
    },
    AyudaRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.AyudaPage(),
      );
    },
    MainNotes.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.MainNotes(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.RegisterPage(),
      );
    },
    ListRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ListPage(),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          LoginRoute.name,
          path: '/',
          guards: [checkIfUserIsGuest],
          children: [
            _i10.RouteConfig(
              RegisterRoute.name,
              path: 'register-page',
              parent: LoginRoute.name,
            )
          ],
        ),
        _i10.RouteConfig(
          PsicHomeRoute.name,
          path: '/psic-home-page',
          guards: [checkIfUserIsPsic],
          children: [
            _i10.RouteConfig(
              ListRoute.name,
              path: 'list-page',
              parent: PsicHomeRoute.name,
            )
          ],
        ),
        _i10.RouteConfig(
          PatHomeRoute.name,
          path: '/',
          guards: [checkIfUserIsPat],
        ),
        _i10.RouteConfig(
          ProfileRoute.name,
          path: '/profile-page',
        ),
        _i10.RouteConfig(
          ProgressRoute.name,
          path: '/progress-page',
        ),
        _i10.RouteConfig(
          AyudaRoute.name,
          path: '/ayuda-page',
        ),
        _i10.RouteConfig(
          MainNotes.name,
          path: '/main-notes',
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.PsicHomePage]
class PsicHomeRoute extends _i10.PageRouteInfo<void> {
  const PsicHomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          PsicHomeRoute.name,
          path: '/psic-home-page',
          initialChildren: children,
        );

  static const String name = 'PsicHomeRoute';
}

/// generated route for
/// [_i3.PatHomePage]
class PatHomeRoute extends _i10.PageRouteInfo<void> {
  const PatHomeRoute()
      : super(
          PatHomeRoute.name,
          path: '/',
        );

  static const String name = 'PatHomeRoute';
}

/// generated route for
/// [_i4.ProfilePage]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile-page',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i5.ProgressPage]
class ProgressRoute extends _i10.PageRouteInfo<void> {
  const ProgressRoute()
      : super(
          ProgressRoute.name,
          path: '/progress-page',
        );

  static const String name = 'ProgressRoute';
}

/// generated route for
/// [_i6.AyudaPage]
class AyudaRoute extends _i10.PageRouteInfo<void> {
  const AyudaRoute()
      : super(
          AyudaRoute.name,
          path: '/ayuda-page',
        );

  static const String name = 'AyudaRoute';
}

/// generated route for
/// [_i7.MainNotes]
class MainNotes extends _i10.PageRouteInfo<void> {
  const MainNotes()
      : super(
          MainNotes.name,
          path: '/main-notes',
        );

  static const String name = 'MainNotes';
}

/// generated route for
/// [_i8.RegisterPage]
class RegisterRoute extends _i10.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: 'register-page',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i9.ListPage]
class ListRoute extends _i10.PageRouteInfo<void> {
  const ListRoute()
      : super(
          ListRoute.name,
          path: 'list-page',
        );

  static const String name = 'ListRoute';
}
