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
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;

import '../pages/auth/model/user_data.dart' as _i20;
import '../pages/auth/view/login_page.dart' as _i1;
import '../pages/auth/view/register_page.dart' as _i2;
import '../pages/usuarios/view/calendar/view/calendar_page.dart' as _i10;
import '../pages/usuarios/view/notas/editor_nota.dart' as _i11;
import '../pages/usuarios/view/notas/lector_notas.dart' as _i12;
import '../pages/usuarios/view/notas/main_notas.dart' as _i9;
import '../pages/usuarios/view/notas/model/note_model.dart' as _i19;
import '../pages/usuarios/view/paciente/home/patient_home_page.dart' as _i4;
import '../pages/usuarios/view/paciente/linea/view/ayuda_linea.dart' as _i7;
import '../pages/usuarios/view/paciente/progress/progress_page.dart' as _i6;
import '../pages/usuarios/view/profile_page.dart' as _i8;
import '../pages/usuarios/view/psicologo/home/psic_home_page.dart' as _i3;
import '../pages/usuarios/view/psicologo/lista/view/list_page.dart' as _i5;
import '../pages/usuarios/view/psicologo/user_funciones/view/funcs_page.dart'
    as _i13;
import 'guest_guard.dart' as _i16;
import 'ispat_guard.dart' as _i18;
import 'ispsic_guard.dart' as _i17;

class AppRouter extends _i14.RootStackRouter {
  AppRouter({
    _i15.GlobalKey<_i15.NavigatorState>? navigatorKey,
    required this.checkIfUserIsGuest,
    required this.checkIfUserIsPsic,
    required this.checkIfUserIsPat,
  }) : super(navigatorKey);

  final _i16.CheckIfUserIsGuest checkIfUserIsGuest;

  final _i17.CheckIfUserIsPsic checkIfUserIsPsic;

  final _i18.CheckIfUserIsPat checkIfUserIsPat;

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.RegisterPage(),
      );
    },
    PsicHomeRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.PsicHomePage(),
      );
    },
    PatHomeRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.PatHomePage(),
      );
    },
    ListRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ListPage(),
      );
    },
    ProgressRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.ProgressPage(),
      );
    },
    AyudaRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.AyudaPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ProfilePage(),
      );
    },
    NotesRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.NotesPage(),
      );
    },
    CalendarRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.CalendarPage(),
      );
    },
    NotaEditRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.NotaEditPage(),
      );
    },
    LectorRoute.name: (routeData) {
      final args = routeData.argsAs<LectorRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.LectorPage(
          args.doc,
          key: args.key,
        ),
      );
    },
    FuncsRoute.name: (routeData) {
      final args = routeData.argsAs<FuncsRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.FuncsPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(
          LoginRoute.name,
          path: '/',
          guards: [checkIfUserIsGuest],
        ),
        _i14.RouteConfig(
          RegisterRoute.name,
          path: '/register-page',
        ),
        _i14.RouteConfig(
          PsicHomeRoute.name,
          path: '/psic-home-page',
          guards: [checkIfUserIsPsic],
        ),
        _i14.RouteConfig(
          PatHomeRoute.name,
          path: '/',
          guards: [checkIfUserIsPat],
        ),
        _i14.RouteConfig(
          ListRoute.name,
          path: '/list-page',
        ),
        _i14.RouteConfig(
          ProgressRoute.name,
          path: '/progress-page',
        ),
        _i14.RouteConfig(
          AyudaRoute.name,
          path: '/ayuda-page',
        ),
        _i14.RouteConfig(
          ProfileRoute.name,
          path: '/profile-page',
        ),
        _i14.RouteConfig(
          NotesRoute.name,
          path: '/notes-page',
        ),
        _i14.RouteConfig(
          CalendarRoute.name,
          path: '/calendar-page',
        ),
        _i14.RouteConfig(
          NotaEditRoute.name,
          path: '/nota-edit-page',
        ),
        _i14.RouteConfig(
          LectorRoute.name,
          path: '/lector-page',
        ),
        _i14.RouteConfig(
          FuncsRoute.name,
          path: '/funcs-page',
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.RegisterPage]
class RegisterRoute extends _i14.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/register-page',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i3.PsicHomePage]
class PsicHomeRoute extends _i14.PageRouteInfo<void> {
  const PsicHomeRoute()
      : super(
          PsicHomeRoute.name,
          path: '/psic-home-page',
        );

  static const String name = 'PsicHomeRoute';
}

/// generated route for
/// [_i4.PatHomePage]
class PatHomeRoute extends _i14.PageRouteInfo<void> {
  const PatHomeRoute()
      : super(
          PatHomeRoute.name,
          path: '/',
        );

  static const String name = 'PatHomeRoute';
}

/// generated route for
/// [_i5.ListPage]
class ListRoute extends _i14.PageRouteInfo<void> {
  const ListRoute()
      : super(
          ListRoute.name,
          path: '/list-page',
        );

  static const String name = 'ListRoute';
}

/// generated route for
/// [_i6.ProgressPage]
class ProgressRoute extends _i14.PageRouteInfo<void> {
  const ProgressRoute()
      : super(
          ProgressRoute.name,
          path: '/progress-page',
        );

  static const String name = 'ProgressRoute';
}

/// generated route for
/// [_i7.AyudaPage]
class AyudaRoute extends _i14.PageRouteInfo<void> {
  const AyudaRoute()
      : super(
          AyudaRoute.name,
          path: '/ayuda-page',
        );

  static const String name = 'AyudaRoute';
}

/// generated route for
/// [_i8.ProfilePage]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile-page',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i9.NotesPage]
class NotesRoute extends _i14.PageRouteInfo<void> {
  const NotesRoute()
      : super(
          NotesRoute.name,
          path: '/notes-page',
        );

  static const String name = 'NotesRoute';
}

/// generated route for
/// [_i10.CalendarPage]
class CalendarRoute extends _i14.PageRouteInfo<void> {
  const CalendarRoute()
      : super(
          CalendarRoute.name,
          path: '/calendar-page',
        );

  static const String name = 'CalendarRoute';
}

/// generated route for
/// [_i11.NotaEditPage]
class NotaEditRoute extends _i14.PageRouteInfo<void> {
  const NotaEditRoute()
      : super(
          NotaEditRoute.name,
          path: '/nota-edit-page',
        );

  static const String name = 'NotaEditRoute';
}

/// generated route for
/// [_i12.LectorPage]
class LectorRoute extends _i14.PageRouteInfo<LectorRouteArgs> {
  LectorRoute({
    required _i19.NotaData doc,
    _i15.Key? key,
  }) : super(
          LectorRoute.name,
          path: '/lector-page',
          args: LectorRouteArgs(
            doc: doc,
            key: key,
          ),
        );

  static const String name = 'LectorRoute';
}

class LectorRouteArgs {
  const LectorRouteArgs({
    required this.doc,
    this.key,
  });

  final _i19.NotaData doc;

  final _i15.Key? key;

  @override
  String toString() {
    return 'LectorRouteArgs{doc: $doc, key: $key}';
  }
}

/// generated route for
/// [_i13.FuncsPage]
class FuncsRoute extends _i14.PageRouteInfo<FuncsRouteArgs> {
  FuncsRoute({
    _i15.Key? key,
    required _i20.UserData doc,
  }) : super(
          FuncsRoute.name,
          path: '/funcs-page',
          args: FuncsRouteArgs(
            key: key,
            doc: doc,
          ),
        );

  static const String name = 'FuncsRoute';
}

class FuncsRouteArgs {
  const FuncsRouteArgs({
    this.key,
    required this.doc,
  });

  final _i15.Key? key;

  final _i20.UserData doc;

  @override
  String toString() {
    return 'FuncsRouteArgs{key: $key, doc: $doc}';
  }
}
