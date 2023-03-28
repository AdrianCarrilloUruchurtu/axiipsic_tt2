// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:axiipsic_tt2/services/calendar_repo.dart' as _i4;
import 'package:axiipsic_tt2/services/nota_repo.dart' as _i6;
import 'package:axiipsic_tt2/services/tareas_repo.dart' as _i9;
import 'package:axiipsic_tt2/services/user_repo.dart' as _i10;
import 'package:axiipsic_tt2/ui/pages/auth/view_model/auth_mobx.dart' as _i3;
import 'package:axiipsic_tt2/ui/pages/usuarios/view/calendar/view-model/calendar_mobx.dart'
    as _i5;
import 'package:axiipsic_tt2/ui/pages/usuarios/view/notas/view-model/notaMobx.dart'
    as _i7;
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tareas/view-model/tarea_mobx.dart'
    as _i8;
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
    gh.factory<_i8.TareaStore>(() => _i8.TareaStore());
    gh.singleton<_i9.TareasRepo>(_i9.TareasRepo());
    gh.singleton<_i10.UserRepo>(_i10.UserRepo());
    return this;
  }
}
