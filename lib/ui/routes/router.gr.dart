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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../pages/auth/view/login_page.dart' as _i1;
import '../pages/auth/view/register_page.dart' as _i2;
import '../pages/usuarios/view/paciente/home/patient_home_page.dart' as _i4;
import '../pages/usuarios/view/profile_page.dart' as _i5;
import '../pages/usuarios/view/psicologo/home/psic_home_page.dart' as _i3;
import '../pages/usuarios/view/psicologo/list_page.dart' as _i6;
import 'guest_guard.dart' as _i9;
import 'ispsic_guard.dart' as _i10;

class AppRouter extends _i7.RootStackRouter {
  AppRouter({
    _i8.GlobalKey<_i8.NavigatorState>? navigatorKey,
    required this.checkIfUserIsGuest,
    required this.checkIfUserIsPsic,
  }) : super(navigatorKey);

  final _i9.CheckIfUserIsGuest checkIfUserIsGuest;

  final _i10.CheckIfUserIsPsic checkIfUserIsPsic;

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.RegisterPage(),
      );
    },
    PsicHomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.PsicHomePage(),
      );
    },
    PatHomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.PatHomePage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ProfilePage(),
      );
    },
    ListRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.ListPage(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          LoginRoute.name,
          path: '/',
          guards: [checkIfUserIsGuest],
        ),
        _i7.RouteConfig(
          RegisterRoute.name,
          path: '/register-page',
        ),
        _i7.RouteConfig(
          PsicHomeRoute.name,
          path: '/psic-home-page',
          guards: [checkIfUserIsPsic],
          children: [
            _i7.RouteConfig(
              ProfileRoute.name,
              path: 'profile-page',
              parent: PsicHomeRoute.name,
            )
          ],
        ),
        _i7.RouteConfig(
          PatHomeRoute.name,
          path: '/pat-home-page',
          guards: [checkIfUserIsPsic],
          children: [
            _i7.RouteConfig(
              ProfileRoute.name,
              path: 'profile-page',
              parent: PatHomeRoute.name,
            ),
            _i7.RouteConfig(
              ListRoute.name,
              path: 'list-page',
              parent: PatHomeRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.RegisterPage]
class RegisterRoute extends _i7.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/register-page',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i3.PsicHomePage]
class PsicHomeRoute extends _i7.PageRouteInfo<void> {
  const PsicHomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          PsicHomeRoute.name,
          path: '/psic-home-page',
          initialChildren: children,
        );

  static const String name = 'PsicHomeRoute';
}

/// generated route for
/// [_i4.PatHomePage]
class PatHomeRoute extends _i7.PageRouteInfo<void> {
  const PatHomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          PatHomeRoute.name,
          path: '/pat-home-page',
          initialChildren: children,
        );

  static const String name = 'PatHomeRoute';
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i7.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile-page',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i6.ListPage]
class ListRoute extends _i7.PageRouteInfo<void> {
  const ListRoute()
      : super(
          ListRoute.name,
          path: 'list-page',
        );

  static const String name = 'ListRoute';
}
