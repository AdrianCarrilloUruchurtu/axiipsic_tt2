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
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../pages/auth/view/login_page.dart' as _i1;
import '../pages/auth/view/register_page.dart' as _i11;
import '../pages/usuarios/view/calendar/view/calendar_page.dart' as _i8;
import '../pages/usuarios/view/notas/editor_nota.dart' as _i9;
import '../pages/usuarios/view/notas/lector_notas.dart' as _i10;
import '../pages/usuarios/view/notas/main_notas.dart' as _i7;
import '../pages/usuarios/view/notas/model/note_model.dart' as _i18;
import '../pages/usuarios/view/paciente/home/patient_home_page.dart' as _i3;
import '../pages/usuarios/view/paciente/linea/view/ayuda_linea.dart' as _i5;
import '../pages/usuarios/view/paciente/progress/progress_page.dart' as _i4;
import '../pages/usuarios/view/profile_page.dart' as _i6;
import '../pages/usuarios/view/psicologo/home/psic_home_page.dart' as _i2;
import '../pages/usuarios/view/psicologo/list_page.dart' as _i12;
import 'guest_guard.dart' as _i15;
import 'ispat_guard.dart' as _i17;
import 'ispsic_guard.dart' as _i16;

class AppRouter extends _i13.RootStackRouter {
  AppRouter({
    _i14.GlobalKey<_i14.NavigatorState>? navigatorKey,
    required this.checkIfUserIsGuest,
    required this.checkIfUserIsPsic,
    required this.checkIfUserIsPat,
  }) : super(navigatorKey);

  final _i15.CheckIfUserIsGuest checkIfUserIsGuest;

  final _i16.CheckIfUserIsPsic checkIfUserIsPsic;

  final _i17.CheckIfUserIsPat checkIfUserIsPat;

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    PsicHomeRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.PsicHomePage(),
      );
    },
    PatHomeRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.PatHomePage(),
      );
    },
    ProgressRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ProgressPage(),
      );
    },
    AyudaRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.AyudaPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.ProfilePage(),
      );
    },
    NotesRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.NotesPage(),
      );
    },
    CalendarRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.CalendarPage(),
      );
    },
    NotaEditRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.NotaEditPage(),
      );
    },
    LectorRoute.name: (routeData) {
      final args = routeData.argsAs<LectorRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.LectorPage(
          args.doc,
          key: args.key,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.RegisterPage(),
      );
    },
    ListRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.ListPage(),
      );
    },
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(
          LoginRoute.name,
          path: '/',
          guards: [checkIfUserIsGuest],
          children: [
            _i13.RouteConfig(
              RegisterRoute.name,
              path: 'register-page',
              parent: LoginRoute.name,
            )
          ],
        ),
        _i13.RouteConfig(
          PsicHomeRoute.name,
          path: '/psic-home-page',
          guards: [checkIfUserIsPsic],
          children: [
            _i13.RouteConfig(
              ListRoute.name,
              path: 'list-page',
              parent: PsicHomeRoute.name,
            )
          ],
        ),
        _i13.RouteConfig(
          PatHomeRoute.name,
          path: '/',
          guards: [checkIfUserIsPat],
        ),
        _i13.RouteConfig(
          ProgressRoute.name,
          path: '/progress-page',
        ),
        _i13.RouteConfig(
          AyudaRoute.name,
          path: '/ayuda-page',
        ),
        _i13.RouteConfig(
          ProfileRoute.name,
          path: '/profile-page',
        ),
        _i13.RouteConfig(
          NotesRoute.name,
          path: '/notes-page',
        ),
        _i13.RouteConfig(
          CalendarRoute.name,
          path: '/calendar-page',
        ),
        _i13.RouteConfig(
          NotaEditRoute.name,
          path: '/nota-edit-page',
        ),
        _i13.RouteConfig(
          LectorRoute.name,
          path: '/lector-page',
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute({List<_i13.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.PsicHomePage]
class PsicHomeRoute extends _i13.PageRouteInfo<void> {
  const PsicHomeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          PsicHomeRoute.name,
          path: '/psic-home-page',
          initialChildren: children,
        );

  static const String name = 'PsicHomeRoute';
}

/// generated route for
/// [_i3.PatHomePage]
class PatHomeRoute extends _i13.PageRouteInfo<void> {
  const PatHomeRoute()
      : super(
          PatHomeRoute.name,
          path: '/',
        );

  static const String name = 'PatHomeRoute';
}

/// generated route for
/// [_i4.ProgressPage]
class ProgressRoute extends _i13.PageRouteInfo<void> {
  const ProgressRoute()
      : super(
          ProgressRoute.name,
          path: '/progress-page',
        );

  static const String name = 'ProgressRoute';
}

/// generated route for
/// [_i5.AyudaPage]
class AyudaRoute extends _i13.PageRouteInfo<void> {
  const AyudaRoute()
      : super(
          AyudaRoute.name,
          path: '/ayuda-page',
        );

  static const String name = 'AyudaRoute';
}

/// generated route for
/// [_i6.ProfilePage]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile-page',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i7.NotesPage]
class NotesRoute extends _i13.PageRouteInfo<void> {
  const NotesRoute()
      : super(
          NotesRoute.name,
          path: '/notes-page',
        );

  static const String name = 'NotesRoute';
}

/// generated route for
/// [_i8.CalendarPage]
class CalendarRoute extends _i13.PageRouteInfo<void> {
  const CalendarRoute()
      : super(
          CalendarRoute.name,
          path: '/calendar-page',
        );

  static const String name = 'CalendarRoute';
}

/// generated route for
/// [_i9.NotaEditPage]
class NotaEditRoute extends _i13.PageRouteInfo<void> {
  const NotaEditRoute()
      : super(
          NotaEditRoute.name,
          path: '/nota-edit-page',
        );

  static const String name = 'NotaEditRoute';
}

/// generated route for
/// [_i10.LectorPage]
class LectorRoute extends _i13.PageRouteInfo<LectorRouteArgs> {
  LectorRoute({
    required _i18.NotaData doc,
    _i14.Key? key,
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

  final _i18.NotaData doc;

  final _i14.Key? key;

  @override
  String toString() {
    return 'LectorRouteArgs{doc: $doc, key: $key}';
  }
}

/// generated route for
/// [_i11.RegisterPage]
class RegisterRoute extends _i13.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: 'register-page',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i12.ListPage]
class ListRoute extends _i13.PageRouteInfo<void> {
  const ListRoute()
      : super(
          ListRoute.name,
          path: 'list-page',
        );

  static const String name = 'ListRoute';
}
