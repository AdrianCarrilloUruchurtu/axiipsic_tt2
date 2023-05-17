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
import 'package:auto_route/auto_route.dart' as _i33;
import 'package:flutter/material.dart' as _i34;

import '../pages/auth/model/user_data.dart' as _i39;
import '../pages/auth/view/forgot_pw_page.dart' as _i32;
import '../pages/auth/view/login_page.dart' as _i1;
import '../pages/auth/view/register_page.dart' as _i2;
import '../pages/usuarios/view/calendar/view/calendar_page.dart' as _i10;
import '../pages/usuarios/view/chat/view/chat_main_page.dart' as _i26;
import '../pages/usuarios/view/chat/view/chat_page.dart' as _i28;
import '../pages/usuarios/view/chat/view/search_page.dart' as _i27;
import '../pages/usuarios/view/historia_clinica.dart/view/fill_historia_page.dart'
    as _i31;
import '../pages/usuarios/view/historia_clinica.dart/view/historia_page.dart'
    as _i30;
import '../pages/usuarios/view/notas/model/note_model.dart' as _i40;
import '../pages/usuarios/view/notas/view/editor_nota.dart' as _i11;
import '../pages/usuarios/view/notas/view/lector_notas.dart' as _i12;
import '../pages/usuarios/view/notas/view/main_notas.dart' as _i9;
import '../pages/usuarios/view/notas/view/sesiones_notas.dart' as _i24;
import '../pages/usuarios/view/paciente/home/patient_home_page.dart' as _i4;
import '../pages/usuarios/view/paciente/linea/view/ayuda_linea.dart' as _i7;
import '../pages/usuarios/view/progreso/model/progreso_model.dart' as _i42;
import '../pages/usuarios/view/progreso/view/lector_conducta.dart' as _i25;
import '../pages/usuarios/view/progreso/view/progress_page.dart' as _i6;
import '../pages/usuarios/view/psic_list.dart/view/psic_list.dart' as _i29;
import '../pages/usuarios/view/psicologo/home/psic_home_page.dart' as _i3;
import '../pages/usuarios/view/psicologo/lista/view/list_page.dart' as _i5;
import '../pages/usuarios/view/psicologo/user_funciones/view/funcs_page.dart'
    as _i13;
import '../pages/usuarios/view/sesiones/model/sesiones_model.dart' as _i38;
import '../pages/usuarios/view/sesiones/view/lector_sesion.dart' as _i23;
import '../pages/usuarios/view/sesiones/view/sesion_add.dart' as _i19;
import '../pages/usuarios/view/sesiones/view/sesiones_page.dart' as _i18;
import '../pages/usuarios/view/tareas/model/tareas_model.dart' as _i41;
import '../pages/usuarios/view/tareas/view/tarea_add_page.dart' as _i17;
import '../pages/usuarios/view/tareas/view/tarea_edit_page.dart' as _i21;
import '../pages/usuarios/view/tareas/view/tarea_lector_page.dart' as _i20;
import '../pages/usuarios/view/tareas/view/tareas_page.dart' as _i16;
import '../pages/usuarios/view/tips/view/add_tips.dart' as _i15;
import '../pages/usuarios/view/tips/view/tip_edit.dart' as _i22;
import '../pages/usuarios/view/tips/view/tips_page.dart' as _i14;
import '../pages/usuarios/view/widget/profile_page.dart' as _i8;
import 'guest_guard.dart' as _i35;
import 'ispat_guard.dart' as _i37;
import 'ispsic_guard.dart' as _i36;

class AppRouter extends _i33.RootStackRouter {
  AppRouter({
    _i34.GlobalKey<_i34.NavigatorState>? navigatorKey,
    required this.checkIfUserIsGuest,
    required this.checkIfUserIsPsic,
    required this.checkIfUserIsPat,
  }) : super(navigatorKey);

  final _i35.CheckIfUserIsGuest checkIfUserIsGuest;

  final _i36.CheckIfUserIsPsic checkIfUserIsPsic;

  final _i37.CheckIfUserIsPat checkIfUserIsPat;

  @override
  final Map<String, _i33.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.RegisterPage(),
      );
    },
    PsicHomeRoute.name: (routeData) {
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.PsicHomePage(),
      );
    },
    PatHomeRoute.name: (routeData) {
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.PatHomePage(),
      );
    },
    ListRoute.name: (routeData) {
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ListPage(),
      );
    },
    ProgressRoute.name: (routeData) {
      final args = routeData.argsAs<ProgressRouteArgs>();
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.ProgressPage(
          key: args.key,
          docSes: args.docSes,
          docPac: args.docPac,
        ),
      );
    },
    AyudaRoute.name: (routeData) {
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.AyudaPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ProfilePage(),
      );
    },
    NotesRoute.name: (routeData) {
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.NotesPage(),
      );
    },
    CalendarRoute.name: (routeData) {
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.CalendarPage(),
      );
    },
    NotaEditRoute.name: (routeData) {
      final args = routeData.argsAs<NotaEditRouteArgs>();
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.NotaEditPage(
          key: args.key,
          isses: args.isses,
          docSesTitulo: args.docSesTitulo,
        ),
      );
    },
    LectorRoute.name: (routeData) {
      final args = routeData.argsAs<LectorRouteArgs>();
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.LectorPage(
          args.doc,
          key: args.key,
        ),
      );
    },
    FuncsRoute.name: (routeData) {
      final args = routeData.argsAs<FuncsRouteArgs>();
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.FuncsPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    TipsRoute.name: (routeData) {
      final args = routeData.argsAs<TipsRouteArgs>();
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.TipsPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    AddTipRoute.name: (routeData) {
      final args = routeData.argsAs<AddTipRouteArgs>();
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.AddTipPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    TareasRoute.name: (routeData) {
      final args = routeData.argsAs<TareasRouteArgs>();
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.TareasPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    TareaAddRoute.name: (routeData) {
      final args = routeData.argsAs<TareaAddRouteArgs>();
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.TareaAddPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    SesionesRoute.name: (routeData) {
      final args = routeData.argsAs<SesionesRouteArgs>();
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.SesionesPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    SesionesAdd.name: (routeData) {
      final args = routeData.argsAs<SesionesAddArgs>();
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i19.SesionesAdd(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    TareaLectorRoute.name: (routeData) {
      final args = routeData.argsAs<TareaLectorRouteArgs>();
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i20.TareaLectorPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    TareaEditRoute.name: (routeData) {
      final args = routeData.argsAs<TareaEditRouteArgs>();
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i21.TareaEditPage(
          key: args.key,
          doc: args.doc,
          docUser: args.docUser,
        ),
      );
    },
    TipEditRoute.name: (routeData) {
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.TipEditPage(),
      );
    },
    LectorSesRoute.name: (routeData) {
      final args = routeData.argsAs<LectorSesRouteArgs>();
      return _i33.MaterialPageX<dynamic>(
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
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i24.NotasSesionesPage(
          key: args.key,
          doc: args.doc,
        ),
      );
    },
    ConductaLectorRoute.name: (routeData) {
      final args = routeData.argsAs<ConductaLectorRouteArgs>();
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i25.ConductaLectorPage(
          key: args.key,
          docProg: args.docProg,
          docSes: args.docSes,
          docPac: args.docPac,
        ),
      );
    },
    ChatMainRoute.name: (routeData) {
      final args = routeData.argsAs<ChatMainRouteArgs>();
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i26.ChatMainPage(
          args.user,
          key: args.key,
        ),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>();
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i27.SearchPage(
          args.user,
          key: args.key,
        ),
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i28.ChatPage(
          key: args.key,
          user: args.user,
          friendId: args.friendId,
          friendName: args.friendName,
          friendUser: args.friendUser,
        ),
      );
    },
    ListPsicRoute.name: (routeData) {
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i29.ListPsicPage(),
      );
    },
    HistoriaRoute.name: (routeData) {
      final args = routeData.argsAs<HistoriaRouteArgs>();
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i30.HistoriaPage(
          key: args.key,
          pac: args.pac,
        ),
      );
    },
    FillHistoriaRoute.name: (routeData) {
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i31.FillHistoriaPage(),
      );
    },
    ForgotRoute.name: (routeData) {
      return _i33.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i32.ForgotPage(),
      );
    },
  };

  @override
  List<_i33.RouteConfig> get routes => [
        _i33.RouteConfig(
          LoginRoute.name,
          path: '/',
          guards: [checkIfUserIsGuest],
        ),
        _i33.RouteConfig(
          RegisterRoute.name,
          path: '/register-page',
        ),
        _i33.RouteConfig(
          PsicHomeRoute.name,
          path: '/psic-home-page',
          guards: [checkIfUserIsPsic],
        ),
        _i33.RouteConfig(
          PatHomeRoute.name,
          path: '/',
          guards: [checkIfUserIsPat],
        ),
        _i33.RouteConfig(
          ListRoute.name,
          path: '/list-page',
        ),
        _i33.RouteConfig(
          ProgressRoute.name,
          path: '/progress-page',
        ),
        _i33.RouteConfig(
          AyudaRoute.name,
          path: '/ayuda-page',
        ),
        _i33.RouteConfig(
          ProfileRoute.name,
          path: '/profile-page',
        ),
        _i33.RouteConfig(
          NotesRoute.name,
          path: '/notes-page',
        ),
        _i33.RouteConfig(
          CalendarRoute.name,
          path: '/calendar-page',
        ),
        _i33.RouteConfig(
          NotaEditRoute.name,
          path: '/nota-edit-page',
        ),
        _i33.RouteConfig(
          LectorRoute.name,
          path: '/lector-page',
        ),
        _i33.RouteConfig(
          FuncsRoute.name,
          path: '/funcs-page',
        ),
        _i33.RouteConfig(
          TipsRoute.name,
          path: '/tips-page',
        ),
        _i33.RouteConfig(
          AddTipRoute.name,
          path: '/add-tip-page',
        ),
        _i33.RouteConfig(
          TareasRoute.name,
          path: '/tareas-page',
        ),
        _i33.RouteConfig(
          TareaAddRoute.name,
          path: '/tarea-add-page',
        ),
        _i33.RouteConfig(
          SesionesRoute.name,
          path: '/sesiones-page',
        ),
        _i33.RouteConfig(
          SesionesAdd.name,
          path: '/sesiones-add',
        ),
        _i33.RouteConfig(
          TareaLectorRoute.name,
          path: '/tarea-lector-page',
        ),
        _i33.RouteConfig(
          TareaEditRoute.name,
          path: '/tarea-edit-page',
        ),
        _i33.RouteConfig(
          TipEditRoute.name,
          path: '/tip-edit-page',
        ),
        _i33.RouteConfig(
          LectorSesRoute.name,
          path: '/lector-ses-page',
        ),
        _i33.RouteConfig(
          NotasSesionesRoute.name,
          path: '/notas-sesiones-page',
        ),
        _i33.RouteConfig(
          ConductaLectorRoute.name,
          path: '/conducta-lector-page',
        ),
        _i33.RouteConfig(
          ChatMainRoute.name,
          path: '/chat-main-page',
        ),
        _i33.RouteConfig(
          SearchRoute.name,
          path: '/search-page',
        ),
        _i33.RouteConfig(
          ChatRoute.name,
          path: '/chat-page',
        ),
        _i33.RouteConfig(
          ListPsicRoute.name,
          path: '/list-psic-page',
        ),
        _i33.RouteConfig(
          HistoriaRoute.name,
          path: '/historia-page',
        ),
        _i33.RouteConfig(
          FillHistoriaRoute.name,
          path: '/fill-historia-page',
        ),
        _i33.RouteConfig(
          ForgotRoute.name,
          path: '/forgot-page',
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i33.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.RegisterPage]
class RegisterRoute extends _i33.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/register-page',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i3.PsicHomePage]
class PsicHomeRoute extends _i33.PageRouteInfo<void> {
  const PsicHomeRoute()
      : super(
          PsicHomeRoute.name,
          path: '/psic-home-page',
        );

  static const String name = 'PsicHomeRoute';
}

/// generated route for
/// [_i4.PatHomePage]
class PatHomeRoute extends _i33.PageRouteInfo<void> {
  const PatHomeRoute()
      : super(
          PatHomeRoute.name,
          path: '/',
        );

  static const String name = 'PatHomeRoute';
}

/// generated route for
/// [_i5.ListPage]
class ListRoute extends _i33.PageRouteInfo<void> {
  const ListRoute()
      : super(
          ListRoute.name,
          path: '/list-page',
        );

  static const String name = 'ListRoute';
}

/// generated route for
/// [_i6.ProgressPage]
class ProgressRoute extends _i33.PageRouteInfo<ProgressRouteArgs> {
  ProgressRoute({
    _i34.Key? key,
    required _i38.SesionesData docSes,
    required _i39.UserData? docPac,
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

  final _i34.Key? key;

  final _i38.SesionesData docSes;

  final _i39.UserData? docPac;

  @override
  String toString() {
    return 'ProgressRouteArgs{key: $key, docSes: $docSes, docPac: $docPac}';
  }
}

/// generated route for
/// [_i7.AyudaPage]
class AyudaRoute extends _i33.PageRouteInfo<void> {
  const AyudaRoute()
      : super(
          AyudaRoute.name,
          path: '/ayuda-page',
        );

  static const String name = 'AyudaRoute';
}

/// generated route for
/// [_i8.ProfilePage]
class ProfileRoute extends _i33.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile-page',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i9.NotesPage]
class NotesRoute extends _i33.PageRouteInfo<void> {
  const NotesRoute()
      : super(
          NotesRoute.name,
          path: '/notes-page',
        );

  static const String name = 'NotesRoute';
}

/// generated route for
/// [_i10.CalendarPage]
class CalendarRoute extends _i33.PageRouteInfo<void> {
  const CalendarRoute()
      : super(
          CalendarRoute.name,
          path: '/calendar-page',
        );

  static const String name = 'CalendarRoute';
}

/// generated route for
/// [_i11.NotaEditPage]
class NotaEditRoute extends _i33.PageRouteInfo<NotaEditRouteArgs> {
  NotaEditRoute({
    _i34.Key? key,
    required String isses,
    String? docSesTitulo,
  }) : super(
          NotaEditRoute.name,
          path: '/nota-edit-page',
          args: NotaEditRouteArgs(
            key: key,
            isses: isses,
            docSesTitulo: docSesTitulo,
          ),
        );

  static const String name = 'NotaEditRoute';
}

class NotaEditRouteArgs {
  const NotaEditRouteArgs({
    this.key,
    required this.isses,
    this.docSesTitulo,
  });

  final _i34.Key? key;

  final String isses;

  final String? docSesTitulo;

  @override
  String toString() {
    return 'NotaEditRouteArgs{key: $key, isses: $isses, docSesTitulo: $docSesTitulo}';
  }
}

/// generated route for
/// [_i12.LectorPage]
class LectorRoute extends _i33.PageRouteInfo<LectorRouteArgs> {
  LectorRoute({
    required _i40.NotaData doc,
    _i34.Key? key,
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

  final _i40.NotaData doc;

  final _i34.Key? key;

  @override
  String toString() {
    return 'LectorRouteArgs{doc: $doc, key: $key}';
  }
}

/// generated route for
/// [_i13.FuncsPage]
class FuncsRoute extends _i33.PageRouteInfo<FuncsRouteArgs> {
  FuncsRoute({
    _i34.Key? key,
    required _i39.UserData doc,
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

  final _i34.Key? key;

  final _i39.UserData doc;

  @override
  String toString() {
    return 'FuncsRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i14.TipsPage]
class TipsRoute extends _i33.PageRouteInfo<TipsRouteArgs> {
  TipsRoute({
    _i34.Key? key,
    required _i39.UserData? doc,
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

  final _i34.Key? key;

  final _i39.UserData? doc;

  @override
  String toString() {
    return 'TipsRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i15.AddTipPage]
class AddTipRoute extends _i33.PageRouteInfo<AddTipRouteArgs> {
  AddTipRoute({
    _i34.Key? key,
    required _i39.UserData? doc,
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

  final _i34.Key? key;

  final _i39.UserData? doc;

  @override
  String toString() {
    return 'AddTipRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i16.TareasPage]
class TareasRoute extends _i33.PageRouteInfo<TareasRouteArgs> {
  TareasRoute({
    _i34.Key? key,
    required _i39.UserData? doc,
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

  final _i34.Key? key;

  final _i39.UserData? doc;

  @override
  String toString() {
    return 'TareasRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i17.TareaAddPage]
class TareaAddRoute extends _i33.PageRouteInfo<TareaAddRouteArgs> {
  TareaAddRoute({
    _i34.Key? key,
    required _i39.UserData? doc,
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

  final _i34.Key? key;

  final _i39.UserData? doc;

  @override
  String toString() {
    return 'TareaAddRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i18.SesionesPage]
class SesionesRoute extends _i33.PageRouteInfo<SesionesRouteArgs> {
  SesionesRoute({
    _i34.Key? key,
    required _i39.UserData? doc,
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

  final _i34.Key? key;

  final _i39.UserData? doc;

  @override
  String toString() {
    return 'SesionesRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i19.SesionesAdd]
class SesionesAdd extends _i33.PageRouteInfo<SesionesAddArgs> {
  SesionesAdd({
    _i34.Key? key,
    required _i39.UserData? doc,
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

  final _i34.Key? key;

  final _i39.UserData? doc;

  @override
  String toString() {
    return 'SesionesAddArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i20.TareaLectorPage]
class TareaLectorRoute extends _i33.PageRouteInfo<TareaLectorRouteArgs> {
  TareaLectorRoute({
    _i34.Key? key,
    required _i41.TareasData doc,
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

  final _i34.Key? key;

  final _i41.TareasData doc;

  @override
  String toString() {
    return 'TareaLectorRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i21.TareaEditPage]
class TareaEditRoute extends _i33.PageRouteInfo<TareaEditRouteArgs> {
  TareaEditRoute({
    _i34.Key? key,
    required _i41.TareasData doc,
    required _i39.UserData? docUser,
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

  final _i34.Key? key;

  final _i41.TareasData doc;

  final _i39.UserData? docUser;

  @override
  String toString() {
    return 'TareaEditRouteArgs{key: $key, doc: $doc, docUser: $docUser}';
  }
}

/// generated route for
/// [_i22.TipEditPage]
class TipEditRoute extends _i33.PageRouteInfo<void> {
  const TipEditRoute()
      : super(
          TipEditRoute.name,
          path: '/tip-edit-page',
        );

  static const String name = 'TipEditRoute';
}

/// generated route for
/// [_i23.LectorSesPage]
class LectorSesRoute extends _i33.PageRouteInfo<LectorSesRouteArgs> {
  LectorSesRoute({
    _i34.Key? key,
    required _i38.SesionesData docSes,
    required _i39.UserData? docPac,
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

  final _i34.Key? key;

  final _i38.SesionesData docSes;

  final _i39.UserData? docPac;

  @override
  String toString() {
    return 'LectorSesRouteArgs{key: $key, docSes: $docSes, docPac: $docPac}';
  }
}

/// generated route for
/// [_i24.NotasSesionesPage]
class NotasSesionesRoute extends _i33.PageRouteInfo<NotasSesionesRouteArgs> {
  NotasSesionesRoute({
    _i34.Key? key,
    required _i38.SesionesData doc,
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

  final _i34.Key? key;

  final _i38.SesionesData doc;

  @override
  String toString() {
    return 'NotasSesionesRouteArgs{key: $key, doc: $doc}';
  }
}

/// generated route for
/// [_i25.ConductaLectorPage]
class ConductaLectorRoute extends _i33.PageRouteInfo<ConductaLectorRouteArgs> {
  ConductaLectorRoute({
    _i34.Key? key,
    required _i42.ProgresoData docProg,
    required _i38.SesionesData docSes,
    required _i39.UserData? docPac,
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

  final _i34.Key? key;

  final _i42.ProgresoData docProg;

  final _i38.SesionesData docSes;

  final _i39.UserData? docPac;

  @override
  String toString() {
    return 'ConductaLectorRouteArgs{key: $key, docProg: $docProg, docSes: $docSes, docPac: $docPac}';
  }
}

/// generated route for
/// [_i26.ChatMainPage]
class ChatMainRoute extends _i33.PageRouteInfo<ChatMainRouteArgs> {
  ChatMainRoute({
    required _i39.UserData? user,
    _i34.Key? key,
  }) : super(
          ChatMainRoute.name,
          path: '/chat-main-page',
          args: ChatMainRouteArgs(
            user: user,
            key: key,
          ),
        );

  static const String name = 'ChatMainRoute';
}

class ChatMainRouteArgs {
  const ChatMainRouteArgs({
    required this.user,
    this.key,
  });

  final _i39.UserData? user;

  final _i34.Key? key;

  @override
  String toString() {
    return 'ChatMainRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [_i27.SearchPage]
class SearchRoute extends _i33.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    required _i39.UserData? user,
    _i34.Key? key,
  }) : super(
          SearchRoute.name,
          path: '/search-page',
          args: SearchRouteArgs(
            user: user,
            key: key,
          ),
        );

  static const String name = 'SearchRoute';
}

class SearchRouteArgs {
  const SearchRouteArgs({
    required this.user,
    this.key,
  });

  final _i39.UserData? user;

  final _i34.Key? key;

  @override
  String toString() {
    return 'SearchRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [_i28.ChatPage]
class ChatRoute extends _i33.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    _i34.Key? key,
    required _i39.UserData? user,
    required String friendId,
    required String friendName,
    _i39.UserData? friendUser,
  }) : super(
          ChatRoute.name,
          path: '/chat-page',
          args: ChatRouteArgs(
            key: key,
            user: user,
            friendId: friendId,
            friendName: friendName,
            friendUser: friendUser,
          ),
        );

  static const String name = 'ChatRoute';
}

class ChatRouteArgs {
  const ChatRouteArgs({
    this.key,
    required this.user,
    required this.friendId,
    required this.friendName,
    this.friendUser,
  });

  final _i34.Key? key;

  final _i39.UserData? user;

  final String friendId;

  final String friendName;

  final _i39.UserData? friendUser;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, user: $user, friendId: $friendId, friendName: $friendName, friendUser: $friendUser}';
  }
}

/// generated route for
/// [_i29.ListPsicPage]
class ListPsicRoute extends _i33.PageRouteInfo<void> {
  const ListPsicRoute()
      : super(
          ListPsicRoute.name,
          path: '/list-psic-page',
        );

  static const String name = 'ListPsicRoute';
}

/// generated route for
/// [_i30.HistoriaPage]
class HistoriaRoute extends _i33.PageRouteInfo<HistoriaRouteArgs> {
  HistoriaRoute({
    _i34.Key? key,
    required _i39.UserData? pac,
  }) : super(
          HistoriaRoute.name,
          path: '/historia-page',
          args: HistoriaRouteArgs(
            key: key,
            pac: pac,
          ),
        );

  static const String name = 'HistoriaRoute';
}

class HistoriaRouteArgs {
  const HistoriaRouteArgs({
    this.key,
    required this.pac,
  });

  final _i34.Key? key;

  final _i39.UserData? pac;

  @override
  String toString() {
    return 'HistoriaRouteArgs{key: $key, pac: $pac}';
  }
}

/// generated route for
/// [_i31.FillHistoriaPage]
class FillHistoriaRoute extends _i33.PageRouteInfo<void> {
  const FillHistoriaRoute()
      : super(
          FillHistoriaRoute.name,
          path: '/fill-historia-page',
        );

  static const String name = 'FillHistoriaRoute';
}

/// generated route for
/// [_i32.ForgotPage]
class ForgotRoute extends _i33.PageRouteInfo<void> {
  const ForgotRoute()
      : super(
          ForgotRoute.name,
          path: '/forgot-page',
        );

  static const String name = 'ForgotRoute';
}
