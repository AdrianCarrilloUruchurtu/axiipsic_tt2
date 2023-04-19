// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:axiipsic_tt2/services/calendar_repo.dart' as _i4;
import 'package:axiipsic_tt2/services/nota_repo.dart' as _i6;
import 'package:axiipsic_tt2/services/sesiones_repo.dart' as _i8;
import 'package:axiipsic_tt2/services/tareas_repo.dart' as _i10;
import 'package:axiipsic_tt2/services/tips_repo.dart' as _i13;
import 'package:axiipsic_tt2/services/user_repo.dart' as _i14;
import 'package:axiipsic_tt2/ui/pages/auth/view_model/auth_mobx.dart' as _i3;
import 'package:axiipsic_tt2/ui/pages/usuarios/view/calendar/view-model/calendar_mobx.dart'
    as _i5;
import 'package:axiipsic_tt2/ui/pages/usuarios/view/notas/view-model/notaMobx.dart'
    as _i7;
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/view-model/sesiones_mobx.dart'
    as _i9;
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tareas/view_model/tareasMobx.dart'
    as _i11;
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tips/view-model/tipsMobx.dart'
    as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
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
    gh.factory<_i7.NotaStore>(() => _i7.NotaStore());
    gh.singleton<_i8.SesionesRepo>(_i8.SesionesRepo());
    gh.factory<_i9.SesionesStore>(() => _i9.SesionesStore());
    gh.singleton<_i10.TareasRepo>(_i10.TareasRepo());
    gh.factory<_i11.TareasStore>(() => _i11.TareasStore(gh<String>()));
    gh.factory<_i12.TipsMobx>(() => _i12.TipsMobx(gh<String>()));
    gh.singleton<_i13.TipsRepo>(_i13.TipsRepo());
    gh.singleton<_i14.UserRepo>(_i14.UserRepo());
    return this;
  }
}
