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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import 'pages/auth/view/login_page.dart' as _i1;
import 'pages/auth/view/register_page.dart' as _i4;
import 'pages/usuarios/view/paciente/home/patient_home_page.dart' as _i2;
import 'pages/usuarios/view/profile_page.dart' as _i3;
import 'pages/usuarios/view/psicologo/list_page.dart' as _i5;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    Login.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Login(),
      );
    },
    PatHomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.PatHomePage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ProfilePage(),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.RegisterPage(key: args.key),
      );
    },
    ListRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ListPage(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          Login.name,
          path: '/',
        ),
        _i6.RouteConfig(
          PatHomeRoute.name,
          path: '/pat-home-page',
        ),
        _i6.RouteConfig(
          ProfileRoute.name,
          path: '/profile-page',
        ),
        _i6.RouteConfig(
          RegisterRoute.name,
          path: '/register-page',
        ),
        _i6.RouteConfig(
          ListRoute.name,
          path: '/list-page',
        ),
      ];
}

/// generated route for
/// [_i1.Login]
class Login extends _i6.PageRouteInfo<void> {
  const Login()
      : super(
          Login.name,
          path: '/',
        );

  static const String name = 'Login';
}

/// generated route for
/// [_i2.PatHomePage]
class PatHomeRoute extends _i6.PageRouteInfo<void> {
  const PatHomeRoute()
      : super(
          PatHomeRoute.name,
          path: '/pat-home-page',
        );

  static const String name = 'PatHomeRoute';
}

/// generated route for
/// [_i3.ProfilePage]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile-page',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i4.RegisterPage]
class RegisterRoute extends _i6.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i7.Key? key})
      : super(
          RegisterRoute.name,
          path: '/register-page',
          args: RegisterRouteArgs(key: key),
        );

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.ListPage]
class ListRoute extends _i6.PageRouteInfo<void> {
  const ListRoute()
      : super(
          ListRoute.name,
          path: '/list-page',
        );

  static const String name = 'ListRoute';
}
