// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:axiipsic_tt2/services/calendar_repo.dart' as _i4;
import 'package:axiipsic_tt2/services/nota_repo.dart' as _i6;
import 'package:axiipsic_tt2/services/progreso_repo.dart' as _i8;
import 'package:axiipsic_tt2/services/sesiones_repo.dart' as _i10;
import 'package:axiipsic_tt2/services/tareas_repo.dart' as _i12;
import 'package:axiipsic_tt2/services/tips_repo.dart' as _i15;
import 'package:axiipsic_tt2/services/user_repo.dart' as _i16;
import 'package:axiipsic_tt2/ui/pages/auth/view_model/auth_mobx.dart' as _i3;
import 'package:axiipsic_tt2/ui/pages/usuarios/view/calendar/view-model/calendar_mobx.dart'
    as _i5;
import 'package:axiipsic_tt2/ui/pages/usuarios/view/notas/view-model/notaMobx.dart'
    as _i7;
import 'package:axiipsic_tt2/ui/pages/usuarios/view/progreso/view-model/progresoMobx.dart'
    as _i9;
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/view-model/sesiones_mobx.dart'
    as _i11;
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tareas/view_model/tareasMobx.dart'
    as _i13;
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tips/view-model/tipsMobx.dart'
    as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AuthMobx>(() => _i3.AuthMobx());
    gh.singleton<_i4.CalendarRepo>(_i4.CalendarRepo());
    gh.factory<_i5.CalendarStore>(() => _i5.CalendarStore());
    gh.singleton<_i6.NotaRepo>(_i6.NotaRepo());
    gh.factory<_i7.NotaStore>(() => _i7.NotaStore(gh<String>()));
    gh.singleton<_i8.ProgresoRepo>(_i8.ProgresoRepo());
    gh.factory<_i9.ProgresoStore>(() => _i9.ProgresoStore(gh<String>()));
    gh.singleton<_i10.SesionesRepo>(_i10.SesionesRepo());
    gh.factory<_i11.SesionesStore>(() => _i11.SesionesStore(gh<String>()));
    gh.singleton<_i12.TareasRepo>(_i12.TareasRepo());
    gh.factory<_i13.TareasStore>(() => _i13.TareasStore(gh<String>()));
    gh.factory<_i14.TipsMobx>(() => _i14.TipsMobx(gh<String>()));
    gh.singleton<_i15.TipsRepo>(_i15.TipsRepo());
    gh.singleton<_i16.UserRepo>(_i16.UserRepo());
    return this;
  }
}
