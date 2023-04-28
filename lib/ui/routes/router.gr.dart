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
import 'package:auto_route/auto_route.dart' as _i26;
import 'package:flutter/material.dart' as _i27;

import '../pages/auth/model/user_data.dart' as _i32;
import '../pages/auth/view/login_page.dart' as _i1;
import '../pages/auth/view/register_page.dart' as _i2;
import '../pages/usuarios/view/calendar/view/calendar_page.dart' as _i10;
import '../pages/usuarios/view/notas/model/note_model.dart' as _i33;
import '../pages/usuarios/view/notas/view/editor_nota.dart' as _i11;
import '../pages/usuarios/view/notas/view/lector_notas.dart' as _i12;
import '../pages/usuarios/view/notas/view/main_notas.dart' as _i9;
import '../pages/usuarios/view/notas/view/sesiones_notas.dart' as _i24;
import '../pages/usuarios/view/paciente/home/patient_home_page.dart' as _i4;
import '../pages/usuarios/view/paciente/linea/view/ayuda_linea.dart' as _i7;
import '../pages/usuarios/view/progreso/model/progreso_model.dart' as _i35;
import '../pages/usuarios/view/progreso/view/lector_conducta.dart' as _i25;
import '../pages/usuarios/view/progreso/view/progress_page.dart' as _i6;
import '../pages/usuarios/view/psicologo/home/psic_home_page.dart' as _i3;
import '../pages/usuarios/view/psicologo/lista/view/list_page.dart' as _i5;
import '../pages/usuarios/view/psicologo/user_funciones/view/funcs_page.dart'
    as _i13;
import '../pages/usuarios/view/sesiones/model/sesiones_model.dart' as _i31;
import '../pages/usuarios/view/sesiones/view/lector_sesion.dart' as _i23;
import '../pages/usuarios/view/sesiones/view/sesion_add.dart' as _i19;
import '../pages/usuarios/view/sesiones/view/sesiones_page.dart' as _i18;
import '../pages/usuarios/view/tareas/model/tareas_model.dart' as _i34;
import '../pages/usuarios/view/tareas/view/tarea_add_page.dart' as _i17;
import '../pages/usuarios/view/tareas/view/tarea_edit_page.dart' as _i21;
import '../pages/usuarios/view/tareas/view/tarea_lector_page.dart' as _i20;
import '../pages/usuarios/view/tareas/view/tareas_page.dart' as _i16;
import '../pages/usuarios/view/tips/view/add_tips.dart' as _i15;
import '../pages/usuarios/view/tips/view/tip_edit.dart' as _i22;
import '../pages/usuarios/view/tips/view/tips_page.dart' as _i14;
import '../pages/usuarios/view/widget/profile_page.dart' as _i8;
import 'guest_guard.dart' as _i28;
import 'ispat_guard.dart' as _i30;
import 'ispsic_guard.dart' as _i29;

class AppRouter extends _i26.RootStackRouter {
  AppRouter({
    _i27.GlobalKey<_i27.NavigatorState>? navigatorKey,
    required this.checkIfUserIsGuest,
    required this.checkIfUserIsPsic,
    required this.checkIfUserIsPat,
  }) : super(navigatorKey);

  final _i28.CheckIfUserIsGuest checkIfUserIsGuest;

  final _i29.CheckIfUserIsPsic checkIfUserIsPsic;

  final _i30.CheckIfUserIsPat checkIfUserIsPat;

  @override
  final Map<String, _i26.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.RegisterPage(),
      );
    },
    PsicHomeRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.PsicHomePage(),
      );
    },
    PatHomeRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.PatHomePage(),
      );
    },
    ListRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ListPage(),
      );
    },
    ProgressRoute.name: (routeData) {
      final args = routeData.argsAs<ProgressRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.ProgressPage(
          key: args.key,
          docSes: args.docSes,
          docPac: args.docPac,
        ),
      );
    },
    AyudaRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.AyudaPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ProfilePage(),
      );
    },
    NotesRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.NotesPage(),
      );
    },
    CalendarRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.CalendarPage(),
      );
    },
    NotaEditRoute.name: (routeData) {
      final args = routeData.argsAs<NotaEditRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.NotaEditPage(
          key: args.key,
          isses: args.isses,
        ),
      );
    },
    LectorRoute.name: (routeData) {
      final args = routeData.argsAs<LectorRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.LectorPage(
          args.doc,
          key: args.key,
        ),
      );
    },
    FuncsRoute.name: (routeData) {
      final args = routeData.argsAs<FuncsRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.FuncsPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    TipsRoute.name: (routeData) {
      final args = routeData.argsAs<TipsRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.TipsPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    AddTipRoute.name: (routeData) {
      final args = routeData.argsAs<AddTipRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.AddTipPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    TareasRoute.name: (routeData) {
      final args = routeData.argsAs<TareasRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.TareasPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    TareaAddRoute.name: (routeData) {
      final args = routeData.argsAs<TareaAddRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.TareaAddPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    SesionesRoute.name: (routeData) {
      final args = routeData.argsAs<SesionesRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.SesionesPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    SesionesAdd.name: (routeData) {
      final args = routeData.argsAs<SesionesAddArgs>();
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i19.SesionesAdd(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    TareaLectorRoute.name: (routeData) {
      final args = routeData.argsAs<TareaLectorRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i20.TareaLectorPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    TareaEditRoute.name: (routeData) {
      final args = routeData.argsAs<TareaEditRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i21.TareaEditPage(
          key: args.key,
          doc: args.doc,
          docUser: args.docUser,
        ),
      );
    },
    TipEditRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.TipEditPage(),
      );
    },
    LectorSesRoute.name: (routeData) {
      final args = routeData.argsAs<LectorSesRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i23.LectorSesPage(
          key: args.key,
          docSes: args.docSes,
          docPac: args.docPac,
        ),
      );
    },
    NotasSesionesRoute.name: (routeData) {
      final args = routeData.argsAs<NotasSesionesRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i24.NotasSesionesPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    ConductaLectorRoute.name: (routeData) {
      final args = routeData.argsAs<ConductaLectorRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i25.ConductaLectorPage(
          key: args.key,
          docProg: args.docProg,
          docSes: args.docSes,
          docPac: args.docPac,
        ),
      );
    },
  };

  @override
  List<_i26.RouteConfig> get routes => [
        _i26.RouteConfig(
          LoginRoute.name,
          path: '/',
          guards: [checkIfUserIsGuest],
        ),
        _i26.RouteConfig(
          RegisterRoute.name,
          path: '/register-page',
        ),
        _i26.RouteConfig(
          PsicHomeRoute.name,
          path: '/psic-home-page',
          guards: [checkIfUserIsPsic],
        ),
        _i26.RouteConfig(
          PatHomeRoute.name,
          path: '/',
          guards: [checkIfUserIsPat],
        ),
        _i26.RouteConfig(
          ListRoute.name,
          path: '/list-page',
        ),
        _i26.RouteConfig(
          ProgressRoute.name,
          path: '/progress-page',
        ),
        _i26.RouteConfig(
          AyudaRoute.name,
          path: '/ayuda-page',
        ),
        _i26.RouteConfig(
          ProfileRoute.name,
          path: '/profile-page',
        ),
        _i26.RouteConfig(
          NotesRoute.name,
          path: '/notes-page',
        ),
        _i26.RouteConfig(
          CalendarRoute.name,
          path: '/calendar-page',
        ),
        _i26.RouteConfig(
          NotaEditRoute.name,
          path: '/nota-edit-page',
        ),
        _i26.RouteConfig(
          LectorRoute.name,
          path: '/lector-page',
        ),
        _i26.RouteConfig(
          FuncsRoute.name,
          path: '/funcs-page',
        ),
        _i26.RouteConfig(
          TipsRoute.name,
          path: '/tips-page',
        ),
        _i26.RouteConfig(
          AddTipRoute.name,
          path: '/add-tip-page',
        ),
        _i26.RouteConfig(
          TareasRoute.name,
          path: '/tareas-page',
        ),
        _i26.RouteConfig(
          TareaAddRoute.name,
          path: '/tarea-add-page',
        ),
        _i26.RouteConfig(
          SesionesRoute.name,
          path: '/sesiones-page',
        ),
        _i26.RouteConfig(
          SesionesAdd.name,
          path: '/sesiones-add',
        ),
        _i26.RouteConfig(
          TareaLectorRoute.name,
          path: '/tarea-lector-page',
        ),
        _i26.RouteConfig(
          TareaEditRoute.name,
          path: '/tarea-edit-page',
        ),
        _i26.RouteConfig(
          TipEditRoute.name,
          path: '/tip-edit-page',
        ),
        _i26.RouteConfig(
          LectorSesRoute.name,
          path: '/lector-ses-page',
        ),
        _i26.RouteConfig(
          NotasSesionesRoute.name,
          path: '/notas-sesiones-page',
        ),
        _i26.RouteConfig(
          ConductaLectorRoute.name,
          path: '/conducta-lector-page',
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i26.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.RegisterPage]
class RegisterRoute extends _i26.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/register-page',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i3.PsicHomePage]
class PsicHomeRoute extends _i26.PageRouteInfo<void> {
  const PsicHomeRoute()
      : super(
          PsicHomeRoute.name,
          path: '/psic-home-page',
        );

  static const String name = 'PsicHomeRoute';
}

/// generated route for
/// [_i4.PatHomePage]
class PatHomeRoute extends _i26.PageRouteInfo<void> {
  const PatHomeRoute()
      : super(
          PatHomeRoute.name,
          path: '/',
        );

  static const String name = 'PatHomeRoute';
}

/// generated route for
/// [_i5.ListPage]
class ListRoute extends _i26.PageRouteInfo<void> {
  const ListRoute()
      : super(
          ListRoute.name,
          path: '/list-page',
        );

  static const String name = 'ListRoute';
}

/// generated route for
/// [_i6.ProgressPage]
class ProgressRoute extends _i26.PageRouteInfo<ProgressRouteArgs> {
  ProgressRoute({
    _i27.Key? key,
    required _i31.SesionesData docSes,
    required _i32.UserData? docPac,
  }) : super(
          ProgressRoute.name,
          path: '/progress-page',
          args: ProgressRouteArgs(
            key: key,
            docSes: docSes,
            docPac: docPac,
          ),
        );

  static const String name = 'ProgressRoute';
}

class ProgressRouteArgs {
  const ProgressRouteArgs({
    this.key,
    required this.docSes,
    required this.docPac,
  });

  final _i27.Key? key;

  final _i31.SesionesData docSes;

  final _i32.UserData? docPac;

  @override
  String toString() {
    return 'ProgressRouteArgs{key: $key, docSes: $docSes, docPac: $docPac}';
  }
}

/// generated route for
/// [_i7.AyudaPage]
class AyudaRoute extends _i26.PageRouteInfo<void> {
  const AyudaRoute()
      : super(
          AyudaRoute.name,
          path: '/ayuda-page',
        );

  static const String name = 'AyudaRoute';
}

/// generated route for
/// [_i8.ProfilePage]
class ProfileRoute extends _i26.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile-page',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i9.NotesPage]
class NotesRoute extends _i26.PageRouteInfo<void> {
  const NotesRoute()
      : super(
          NotesRoute.name,
          path: '/notes-page',
        );

  static const String name = 'NotesRoute';
}

/// generated route for
/// [_i10.CalendarPage]
class CalendarRoute extends _i26.PageRouteInfo<void> {
  const CalendarRoute()
      : super(
          CalendarRoute.name,
          path: '/calendar-page',
        );

  static const String name = 'CalendarRoute';
}

/// generated route for
/// [_i11.NotaEditPage]
class NotaEditRoute extends _i26.PageRouteInfo<NotaEditRouteArgs> {
  NotaEditRoute({
    _i27.Key? key,
    required String isses,
  }) : super(
          NotaEditRoute.name,
          path: '/nota-edit-page',
          args: NotaEditRouteArgs(
            key: key,
            isses: isses,
          ),
        );

  static const String name = 'NotaEditRoute';
}

class NotaEditRouteArgs {
  const NotaEditRouteArgs({
    this.key,
    required this.isses,
  });

  final _i27.Key? key;

  final String isses;

  @override
  String toString() {
    return 'NotaEditRouteArgs{key: $key, isses: $isses}';
  }
}

/// generated route for
/// [_i12.LectorPage]
class LectorRoute extends _i26.PageRouteInfo<LectorRouteArgs> {
  LectorRoute({
    required _i33.NotaData doc,
    _i27.Key? key,
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

  final _i33.NotaData doc;

  final _i27.Key? key;

  @override
  String toString() {
    return 'LectorRouteArgs{doc: $doc, key: $key}';
  }
}

/// generated route for
/// [_i13.FuncsPage]
class FuncsRoute extends _i26.PageRouteInfo<FuncsRouteArgs> {
  FuncsRoute({
    _i27.Key? key,
    required _i32.UserData doc,
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

  final _i27.Key? key;

  final _i32.UserData doc;

  @override
  String toString() {
    return 'FuncsRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i14.TipsPage]
class TipsRoute extends _i26.PageRouteInfo<TipsRouteArgs> {
  TipsRoute({
    _i27.Key? key,
    required _i32.UserData? doc,
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

  final _i27.Key? key;

  final _i32.UserData? doc;

  @override
  String toString() {
    return 'TipsRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i15.AddTipPage]
class AddTipRoute extends _i26.PageRouteInfo<AddTipRouteArgs> {
  AddTipRoute({
    _i27.Key? key,
    required _i32.UserData? doc,
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

  final _i27.Key? key;

  final _i32.UserData? doc;

  @override
  String toString() {
    return 'AddTipRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i16.TareasPage]
class TareasRoute extends _i26.PageRouteInfo<TareasRouteArgs> {
  TareasRoute({
    _i27.Key? key,
    required _i32.UserData? doc,
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

  final _i27.Key? key;

  final _i32.UserData? doc;

  @override
  String toString() {
    return 'TareasRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i17.TareaAddPage]
class TareaAddRoute extends _i26.PageRouteInfo<TareaAddRouteArgs> {
  TareaAddRoute({
    _i27.Key? key,
    required _i32.UserData? doc,
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

  final _i27.Key? key;

  final _i32.UserData? doc;

  @override
  String toString() {
    return 'TareaAddRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i18.SesionesPage]
class SesionesRoute extends _i26.PageRouteInfo<SesionesRouteArgs> {
  SesionesRoute({
    _i27.Key? key,
    required _i32.UserData? doc,
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

  final _i27.Key? key;

  final _i32.UserData? doc;

  @override
  String toString() {
    return 'SesionesRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i19.SesionesAdd]
class SesionesAdd extends _i26.PageRouteInfo<SesionesAddArgs> {
  SesionesAdd({
    _i27.Key? key,
    required _i32.UserData? doc,
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

  final _i27.Key? key;

  final _i32.UserData? doc;

  @override
  String toString() {
    return 'SesionesAddArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i20.TareaLectorPage]
class TareaLectorRoute extends _i26.PageRouteInfo<TareaLectorRouteArgs> {
  TareaLectorRoute({
    _i27.Key? key,
    required _i34.TareasData doc,
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

  final _i27.Key? key;

  final _i34.TareasData doc;

  @override
  String toString() {
    return 'TareaLectorRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i21.TareaEditPage]
class TareaEditRoute extends _i26.PageRouteInfo<TareaEditRouteArgs> {
  TareaEditRoute({
    _i27.Key? key,
    required _i34.TareasData doc,
    required _i32.UserData? docUser,
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

  final _i27.Key? key;

  final _i34.TareasData doc;

  final _i32.UserData? docUser;

  @override
  String toString() {
    return 'TareaEditRouteArgs{key: $key, doc: $doc, docUser: $docUser}';
  }
}

/// generated route for
/// [_i22.TipEditPage]
class TipEditRoute extends _i26.PageRouteInfo<void> {
  const TipEditRoute()
      : super(
          TipEditRoute.name,
          path: '/tip-edit-page',
        );

  static const String name = 'TipEditRoute';
}

/// generated route for
/// [_i23.LectorSesPage]
class LectorSesRoute extends _i26.PageRouteInfo<LectorSesRouteArgs> {
  LectorSesRoute({
    _i27.Key? key,
    required _i31.SesionesData docSes,
    required _i32.UserData? docPac,
  }) : super(
          LectorSesRoute.name,
          path: '/lector-ses-page',
          args: LectorSesRouteArgs(
            key: key,
            docSes: docSes,
            docPac: docPac,
          ),
        );

  static const String name = 'LectorSesRoute';
}

class LectorSesRouteArgs {
  const LectorSesRouteArgs({
    this.key,
    required this.docSes,
    required this.docPac,
  });

  final _i27.Key? key;

  final _i31.SesionesData docSes;

  final _i32.UserData? docPac;

  @override
  String toString() {
    return 'LectorSesRouteArgs{key: $key, docSes: $docSes, docPac: $docPac}';
  }
}

/// generated route for
/// [_i24.NotasSesionesPage]
class NotasSesionesRoute extends _i26.PageRouteInfo<NotasSesionesRouteArgs> {
  NotasSesionesRoute({
    _i27.Key? key,
    required _i31.SesionesData doc,
  }) : super(
          NotasSesionesRoute.name,
          path: '/notas-sesiones-page',
          args: NotasSesionesRouteArgs(
            key: key,
            doc: doc,
          ),
        );

  static const String name = 'NotasSesionesRoute';
}

class NotasSesionesRouteArgs {
  const NotasSesionesRouteArgs({
    this.key,
    required this.doc,
  });

  final _i27.Key? key;

  final _i31.SesionesData doc;

  @override
  String toString() {
    return 'NotasSesionesRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i25.ConductaLectorPage]
class ConductaLectorRoute extends _i26.PageRouteInfo<ConductaLectorRouteArgs> {
  ConductaLectorRoute({
    _i27.Key? key,
    required _i35.ProgresoData docProg,
    required _i31.SesionesData docSes,
    required _i32.UserData? docPac,
  }) : super(
          ConductaLectorRoute.name,
          path: '/conducta-lector-page',
          args: ConductaLectorRouteArgs(
            key: key,
            docProg: docProg,
            docSes: docSes,
            docPac: docPac,
          ),
        );

  static const String name = 'ConductaLectorRoute';
}

class ConductaLectorRouteArgs {
  const ConductaLectorRouteArgs({
    this.key,
    required this.docProg,
    required this.docSes,
    required this.docPac,
  });

  final _i27.Key? key;

  final _i35.ProgresoData docProg;

  final _i31.SesionesData docSes;

  final _i32.UserData? docPac;

  @override
  String toString() {
    return 'ConductaLectorRouteArgs{key: $key, docProg: $docProg, docSes: $docSes, docPac: $docPac}';
  }
}
