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
import 'package:auto_route/auto_route.dart' as _i23;
import 'package:flutter/material.dart' as _i24;

import '../pages/auth/model/user_data.dart' as _i29;
import '../pages/auth/view/login_page.dart' as _i1;
import '../pages/auth/view/register_page.dart' as _i2;
import '../pages/usuarios/view/calendar/view/calendar_page.dart' as _i10;
import '../pages/usuarios/view/notas/model/note_model.dart' as _i28;
import '../pages/usuarios/view/notas/view/editor_nota.dart' as _i11;
import '../pages/usuarios/view/notas/view/lector_notas.dart' as _i12;
import '../pages/usuarios/view/notas/view/main_notas.dart' as _i9;
import '../pages/usuarios/view/paciente/home/patient_home_page.dart' as _i4;
import '../pages/usuarios/view/paciente/linea/view/ayuda_linea.dart' as _i7;
import '../pages/usuarios/view/paciente/progress/progress_page.dart' as _i6;
import '../pages/usuarios/view/profile_page.dart' as _i8;
import '../pages/usuarios/view/psicologo/home/psic_home_page.dart' as _i3;
import '../pages/usuarios/view/psicologo/lista/view/list_page.dart' as _i5;
import '../pages/usuarios/view/psicologo/user_funciones/view/funcs_page.dart'
    as _i13;
import '../pages/usuarios/view/sesiones/view/sesion_add.dart' as _i19;
import '../pages/usuarios/view/sesiones/view/sesiones_page.dart' as _i18;
import '../pages/usuarios/view/tareas/model/tareas_model.dart' as _i30;
import '../pages/usuarios/view/tareas/view/tarea_add_page.dart' as _i17;
import '../pages/usuarios/view/tareas/view/tarea_edit_page.dart' as _i21;
import '../pages/usuarios/view/tareas/view/tarea_lector_page.dart' as _i20;
import '../pages/usuarios/view/tareas/view/tareas_page.dart' as _i16;
import '../pages/usuarios/view/tips/view/add_tips.dart' as _i15;
import '../pages/usuarios/view/tips/view/tip_edit.dart' as _i22;
import '../pages/usuarios/view/tips/view/tips_page.dart' as _i14;
import 'guest_guard.dart' as _i25;
import 'ispat_guard.dart' as _i27;
import 'ispsic_guard.dart' as _i26;

class AppRouter extends _i23.RootStackRouter {
  AppRouter({
    _i24.GlobalKey<_i24.NavigatorState>? navigatorKey,
    required this.checkIfUserIsGuest,
    required this.checkIfUserIsPsic,
    required this.checkIfUserIsPat,
  }) : super(navigatorKey);

  final _i25.CheckIfUserIsGuest checkIfUserIsGuest;

  final _i26.CheckIfUserIsPsic checkIfUserIsPsic;

  final _i27.CheckIfUserIsPat checkIfUserIsPat;

  @override
  final Map<String, _i23.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.RegisterPage(),
      );
    },
    PsicHomeRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.PsicHomePage(),
      );
    },
    PatHomeRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.PatHomePage(),
      );
    },
    ListRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ListPage(),
      );
    },
    ProgressRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.ProgressPage(),
      );
    },
    AyudaRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.AyudaPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ProfilePage(),
      );
    },
    NotesRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.NotesPage(),
      );
    },
    CalendarRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.CalendarPage(),
      );
    },
    NotaEditRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.NotaEditPage(),
      );
    },
    LectorRoute.name: (routeData) {
      final args = routeData.argsAs<LectorRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.LectorPage(
          args.doc,
          key: args.key,
        ),
      );
    },
    FuncsRoute.name: (routeData) {
      final args = routeData.argsAs<FuncsRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.FuncsPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    TipsRoute.name: (routeData) {
      final args = routeData.argsAs<TipsRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.TipsPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    AddTipRoute.name: (routeData) {
      final args = routeData.argsAs<AddTipRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.AddTipPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    TareasRoute.name: (routeData) {
      final args = routeData.argsAs<TareasRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.TareasPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    TareaAddRoute.name: (routeData) {
      final args = routeData.argsAs<TareaAddRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.TareaAddPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    SesionesRoute.name: (routeData) {
      final args = routeData.argsAs<SesionesRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.SesionesPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    SesionesAdd.name: (routeData) {
      final args = routeData.argsAs<SesionesAddArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i19.SesionesAdd(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    TareaLectorRoute.name: (routeData) {
      final args = routeData.argsAs<TareaLectorRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i20.TareaLectorPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    TareaEditRoute.name: (routeData) {
      final args = routeData.argsAs<TareaEditRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i21.TareaEditPage(
          key: args.key,
          doc: args.doc,
          docUser: args.docUser,
        ),
      );
    },
    TipEditRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.TipEditPage(),
      );
    },
  };

  @override
  List<_i23.RouteConfig> get routes => [
        _i23.RouteConfig(
          LoginRoute.name,
          path: '/',
          guards: [checkIfUserIsGuest],
        ),
        _i23.RouteConfig(
          RegisterRoute.name,
          path: '/register-page',
        ),
        _i23.RouteConfig(
          PsicHomeRoute.name,
          path: '/psic-home-page',
          guards: [checkIfUserIsPsic],
        ),
        _i23.RouteConfig(
          PatHomeRoute.name,
          path: '/',
          guards: [checkIfUserIsPat],
        ),
        _i23.RouteConfig(
          ListRoute.name,
          path: '/list-page',
        ),
        _i23.RouteConfig(
          ProgressRoute.name,
          path: '/progress-page',
        ),
        _i23.RouteConfig(
          AyudaRoute.name,
          path: '/ayuda-page',
        ),
        _i23.RouteConfig(
          ProfileRoute.name,
          path: '/profile-page',
        ),
        _i23.RouteConfig(
          NotesRoute.name,
          path: '/notes-page',
        ),
        _i23.RouteConfig(
          CalendarRoute.name,
          path: '/calendar-page',
        ),
        _i23.RouteConfig(
          NotaEditRoute.name,
          path: '/nota-edit-page',
        ),
        _i23.RouteConfig(
          LectorRoute.name,
          path: '/lector-page',
        ),
        _i23.RouteConfig(
          FuncsRoute.name,
          path: '/funcs-page',
        ),
        _i23.RouteConfig(
          TipsRoute.name,
          path: '/tips-page',
        ),
        _i23.RouteConfig(
          AddTipRoute.name,
          path: '/add-tip-page',
        ),
        _i23.RouteConfig(
          TareasRoute.name,
          path: '/tareas-page',
        ),
        _i23.RouteConfig(
          TareaAddRoute.name,
          path: '/tarea-add-page',
        ),
        _i23.RouteConfig(
          SesionesRoute.name,
          path: '/sesiones-page',
        ),
        _i23.RouteConfig(
          SesionesAdd.name,
          path: '/sesiones-add',
        ),
        _i23.RouteConfig(
          TareaLectorRoute.name,
          path: '/tarea-lector-page',
        ),
        _i23.RouteConfig(
          TareaEditRoute.name,
          path: '/tarea-edit-page',
        ),
        _i23.RouteConfig(
          TipEditRoute.name,
          path: '/tip-edit-page',
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i23.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.RegisterPage]
class RegisterRoute extends _i23.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/register-page',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i3.PsicHomePage]
class PsicHomeRoute extends _i23.PageRouteInfo<void> {
  const PsicHomeRoute()
      : super(
          PsicHomeRoute.name,
          path: '/psic-home-page',
        );

  static const String name = 'PsicHomeRoute';
}

/// generated route for
/// [_i4.PatHomePage]
class PatHomeRoute extends _i23.PageRouteInfo<void> {
  const PatHomeRoute()
      : super(
          PatHomeRoute.name,
          path: '/',
        );

  static const String name = 'PatHomeRoute';
}

/// generated route for
/// [_i5.ListPage]
class ListRoute extends _i23.PageRouteInfo<void> {
  const ListRoute()
      : super(
          ListRoute.name,
          path: '/list-page',
        );

  static const String name = 'ListRoute';
}

/// generated route for
/// [_i6.ProgressPage]
class ProgressRoute extends _i23.PageRouteInfo<void> {
  const ProgressRoute()
      : super(
          ProgressRoute.name,
          path: '/progress-page',
        );

  static const String name = 'ProgressRoute';
}

/// generated route for
/// [_i7.AyudaPage]
class AyudaRoute extends _i23.PageRouteInfo<void> {
  const AyudaRoute()
      : super(
          AyudaRoute.name,
          path: '/ayuda-page',
        );

  static const String name = 'AyudaRoute';
}

/// generated route for
/// [_i8.ProfilePage]
class ProfileRoute extends _i23.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile-page',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i9.NotesPage]
class NotesRoute extends _i23.PageRouteInfo<void> {
  const NotesRoute()
      : super(
          NotesRoute.name,
          path: '/notes-page',
        );

  static const String name = 'NotesRoute';
}

/// generated route for
/// [_i10.CalendarPage]
class CalendarRoute extends _i23.PageRouteInfo<void> {
  const CalendarRoute()
      : super(
          CalendarRoute.name,
          path: '/calendar-page',
        );

  static const String name = 'CalendarRoute';
}

/// generated route for
/// [_i11.NotaEditPage]
class NotaEditRoute extends _i23.PageRouteInfo<void> {
  const NotaEditRoute()
      : super(
          NotaEditRoute.name,
          path: '/nota-edit-page',
        );

  static const String name = 'NotaEditRoute';
}

/// generated route for
/// [_i12.LectorPage]
class LectorRoute extends _i23.PageRouteInfo<LectorRouteArgs> {
  LectorRoute({
    required _i28.NotaData doc,
    _i24.Key? key,
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

  final _i28.NotaData doc;

  final _i24.Key? key;

  @override
  String toString() {
    return 'LectorRouteArgs{doc: $doc, key: $key}';
  }
}

/// generated route for
/// [_i13.FuncsPage]
class FuncsRoute extends _i23.PageRouteInfo<FuncsRouteArgs> {
  FuncsRoute({
    _i24.Key? key,
    required _i29.UserData doc,
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

  final _i24.Key? key;

  final _i29.UserData doc;

  @override
  String toString() {
    return 'FuncsRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i14.TipsPage]
class TipsRoute extends _i23.PageRouteInfo<TipsRouteArgs> {
  TipsRoute({
    _i24.Key? key,
    required _i29.UserData doc,
  }) : super(
          TipsRoute.name,
          path: '/tips-page',
          args: TipsRouteArgs(
            key: key,
            doc: doc,
          ),
        );

  static const String name = 'TipsRoute';
}

class TipsRouteArgs {
  const TipsRouteArgs({
    this.key,
    required this.doc,
  });

  final _i24.Key? key;

  final _i29.UserData doc;

  @override
  String toString() {
    return 'TipsRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i15.AddTipPage]
class AddTipRoute extends _i23.PageRouteInfo<AddTipRouteArgs> {
  AddTipRoute({
    _i24.Key? key,
    required _i29.UserData doc,
  }) : super(
          AddTipRoute.name,
          path: '/add-tip-page',
          args: AddTipRouteArgs(
            key: key,
            doc: doc,
          ),
        );

  static const String name = 'AddTipRoute';
}

class AddTipRouteArgs {
  const AddTipRouteArgs({
    this.key,
    required this.doc,
  });

  final _i24.Key? key;

  final _i29.UserData doc;

  @override
  String toString() {
    return 'AddTipRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i16.TareasPage]
class TareasRoute extends _i23.PageRouteInfo<TareasRouteArgs> {
  TareasRoute({
    _i24.Key? key,
    required _i29.UserData doc,
  }) : super(
          TareasRoute.name,
          path: '/tareas-page',
          args: TareasRouteArgs(
            key: key,
            doc: doc,
          ),
        );

  static const String name = 'TareasRoute';
}

class TareasRouteArgs {
  const TareasRouteArgs({
    this.key,
    required this.doc,
  });

  final _i24.Key? key;

  final _i29.UserData doc;

  @override
  String toString() {
    return 'TareasRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i17.TareaAddPage]
class TareaAddRoute extends _i23.PageRouteInfo<TareaAddRouteArgs> {
  TareaAddRoute({
    _i24.Key? key,
    required _i29.UserData doc,
  }) : super(
          TareaAddRoute.name,
          path: '/tarea-add-page',
          args: TareaAddRouteArgs(
            key: key,
            doc: doc,
          ),
        );

  static const String name = 'TareaAddRoute';
}

class TareaAddRouteArgs {
  const TareaAddRouteArgs({
    this.key,
    required this.doc,
  });

  final _i24.Key? key;

  final _i29.UserData doc;

  @override
  String toString() {
    return 'TareaAddRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i18.SesionesPage]
class SesionesRoute extends _i23.PageRouteInfo<SesionesRouteArgs> {
  SesionesRoute({
    _i24.Key? key,
    required _i29.UserData doc,
  }) : super(
          SesionesRoute.name,
          path: '/sesiones-page',
          args: SesionesRouteArgs(
            key: key,
            doc: doc,
          ),
        );

  static const String name = 'SesionesRoute';
}

class SesionesRouteArgs {
  const SesionesRouteArgs({
    this.key,
    required this.doc,
  });

  final _i24.Key? key;

  final _i29.UserData doc;

  @override
  String toString() {
    return 'SesionesRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i19.SesionesAdd]
class SesionesAdd extends _i23.PageRouteInfo<SesionesAddArgs> {
  SesionesAdd({
    _i24.Key? key,
    required _i29.UserData doc,
  }) : super(
          SesionesAdd.name,
          path: '/sesiones-add',
          args: SesionesAddArgs(
            key: key,
            doc: doc,
          ),
        );

  static const String name = 'SesionesAdd';
}

class SesionesAddArgs {
  const SesionesAddArgs({
    this.key,
    required this.doc,
  });

  final _i24.Key? key;

  final _i29.UserData doc;

  @override
  String toString() {
    return 'SesionesAddArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i20.TareaLectorPage]
class TareaLectorRoute extends _i23.PageRouteInfo<TareaLectorRouteArgs> {
  TareaLectorRoute({
    _i24.Key? key,
    required _i30.TareasData doc,
  }) : super(
          TareaLectorRoute.name,
          path: '/tarea-lector-page',
          args: TareaLectorRouteArgs(
            key: key,
            doc: doc,
          ),
        );

  static const String name = 'TareaLectorRoute';
}

class TareaLectorRouteArgs {
  const TareaLectorRouteArgs({
    this.key,
    required this.doc,
  });

  final _i24.Key? key;

  final _i30.TareasData doc;

  @override
  String toString() {
    return 'TareaLectorRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i21.TareaEditPage]
class TareaEditRoute extends _i23.PageRouteInfo<TareaEditRouteArgs> {
  TareaEditRoute({
    _i24.Key? key,
    required _i30.TareasData doc,
    required _i29.UserData docUser,
  }) : super(
          TareaEditRoute.name,
          path: '/tarea-edit-page',
          args: TareaEditRouteArgs(
            key: key,
            doc: doc,
            docUser: docUser,
          ),
        );

  static const String name = 'TareaEditRoute';
}

class TareaEditRouteArgs {
  const TareaEditRouteArgs({
    this.key,
    required this.doc,
    required this.docUser,
  });

  final _i24.Key? key;

  final _i30.TareasData doc;

  final _i29.UserData docUser;

  @override
  String toString() {
    return 'TareaEditRouteArgs{key: $key, doc: $doc, docUser: $docUser}';
  }
}

/// generated route for
/// [_i22.TipEditPage]
class TipEditRoute extends _i23.PageRouteInfo<void> {
  const TipEditRoute()
      : super(
          TipEditRoute.name,
          path: '/tip-edit-page',
        );

  static const String name = 'TipEditRoute';
}
