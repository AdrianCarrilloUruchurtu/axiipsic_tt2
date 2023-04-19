import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/services/sesiones_repo.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/model/sesiones_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'sesiones_mobx.g.dart';

@injectable
class SesionesStore = _SesionesStoreBase with _$SesionesStore;

abstract class _SesionesStoreBase with Store {
  final _sesionesRepo = getIt.get<SesionesRepo>();

  _SesionesStoreBase() {
    _sesionesRepo.sesionesChanges().listen((event) {
      sesionesList = event;
    });
  }

  crearSesion(
      int id, List<String> owners, List<int> rapport, List<int> evaluacion) {
    _sesionesRepo.sesionesAdd(id, owners, rapport, evaluacion);
  }

  @observable
  List<SesionesData>? sesionesList;
}
