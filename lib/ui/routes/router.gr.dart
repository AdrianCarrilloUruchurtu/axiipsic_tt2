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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../pages/auth/view/login_page.dart' as _i1;
import '../pages/auth/view/register_page.dart' as _i9;
import '../pages/usuarios/view/calendar/view/calendar_page.dart' as _i8;
import '../pages/usuarios/view/notas/main_notas.dart' as _i7;
import '../pages/usuarios/view/paciente/home/patient_home_page.dart' as _i3;
import '../pages/usuarios/view/paciente/linea/view/ayuda_linea.dart' as _i5;
import '../pages/usuarios/view/paciente/progress/progress_page.dart' as _i4;
import '../pages/usuarios/view/profile_page.dart' as _i6;
import '../pages/usuarios/view/psicologo/home/psic_home_page.dart' as _i2;
import '../pages/usuarios/view/psicologo/list_page.dart' as _i10;
import 'guest_guard.dart' as _i13;
import 'ispat_guard.dart' as _i15;
import 'ispsic_guard.dart' as _i14;

class AppRouter extends _i11.RootStackRouter {
  AppRouter({
    _i12.GlobalKey<_i12.NavigatorState>? navigatorKey,
    required this.checkIfUserIsGuest,
    required this.checkIfUserIsPsic,
    required this.checkIfUserIsPat,
  }) : super(navigatorKey);

  final _i13.CheckIfUserIsGuest checkIfUserIsGuest;

  final _i14.CheckIfUserIsPsic checkIfUserIsPsic;

  final _i15.CheckIfUserIsPat checkIfUserIsPat;

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    PsicHomeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.PsicHomePage(),
      );
    },
    PatHomeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.PatHomePage(),
      );
    },
    ProgressRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ProgressPage(),
      );
    },
    AyudaRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.AyudaPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.ProfilePage(),
      );
    },
    NotesRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.NotesPage(),
      );
    },
    CalendarRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.CalendarPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.RegisterPage(),
      );
    },
    ListRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.ListPage(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          LoginRoute.name,
          path: '/',
          guards: [checkIfUserIsGuest],
          children: [
            _i11.RouteConfig(
              RegisterRoute.name,
              path: 'register-page',
              parent: LoginRoute.name,
            )
          ],
        ),
        _i11.RouteConfig(
          PsicHomeRoute.name,
          path: '/psic-home-page',
          guards: [checkIfUserIsPsic],
          children: [
            _i11.RouteConfig(
              ListRoute.name,
              path: 'list-page',
              parent: PsicHomeRoute.name,
            )
          ],
        ),
        _i11.RouteConfig(
          PatHomeRoute.name,
          path: '/',
          guards: [checkIfUserIsPat],
        ),
        _i11.RouteConfig(
          ProgressRoute.name,
          path: '/progress-page',
        ),
        _i11.RouteConfig(
          AyudaRoute.name,
          path: '/ayuda-page',
        ),
        _i11.RouteConfig(
          ProfileRoute.name,
          path: '/profile-page',
        ),
        _i11.RouteConfig(
          NotesRoute.name,
          path: '/notes-page',
        ),
        _i11.RouteConfig(
          CalendarRoute.name,
          path: '/calendar-page',
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.PsicHomePage]
class PsicHomeRoute extends _i11.PageRouteInfo<void> {
  const PsicHomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          PsicHomeRoute.name,
          path: '/psic-home-page',
          initialChildren: children,
        );

  static const String name = 'PsicHomeRoute';
}

/// generated route for
/// [_i3.PatHomePage]
class PatHomeRoute extends _i11.PageRouteInfo<void> {
  const PatHomeRoute()
      : super(
          PatHomeRoute.name,
          path: '/',
        );

  static const String name = 'PatHomeRoute';
}

/// generated route for
/// [_i4.ProgressPage]
class ProgressRoute extends _i11.PageRouteInfo<void> {
  const ProgressRoute()
      : super(
          ProgressRoute.name,
          path: '/progress-page',
        );

  static const String name = 'ProgressRoute';
}

/// generated route for
/// [_i5.AyudaPage]
class AyudaRoute extends _i11.PageRouteInfo<void> {
  const AyudaRoute()
      : super(
          AyudaRoute.name,
          path: '/ayuda-page',
        );

  static const String name = 'AyudaRoute';
}

/// generated route for
/// [_i6.ProfilePage]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile-page',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i7.NotesPage]
class NotesRoute extends _i11.PageRouteInfo<void> {
  const NotesRoute()
      : super(
          NotesRoute.name,
          path: '/notes-page',
        );

  static const String name = 'NotesRoute';
}

/// generated route for
/// [_i8.CalendarPage]
class CalendarRoute extends _i11.PageRouteInfo<void> {
  const CalendarRoute()
      : super(
          CalendarRoute.name,
          path: '/calendar-page',
        );

  static const String name = 'CalendarRoute';
}

/// generated route for
/// [_i9.RegisterPage]
class RegisterRoute extends _i11.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: 'register-page',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i10.ListPage]
class ListRoute extends _i11.PageRouteInfo<void> {
  const ListRoute()
      : super(
          ListRoute.name,
          path: 'list-page',
        );

  static const String name = 'ListRoute';
}
