import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/progreso/model/progreso_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../services/progreso_repo.dart';
part 'progresoMobx.g.dart';

@injectable
class ProgresoStore = _ProgresoStoreBase with _$ProgresoStore;

abstract class _ProgresoStoreBase with Store {
  final _progresoRepo = getIt.get<ProgresoRepo>();

  _ProgresoStoreBase(String id) {
    _progresoRepo.progresoChanges(id).listen((event) {
      progresoLista = event;
    });
  }

  @action
  addProgreso(
    String conducta,
    List<double?> lunes,
    List<double?> martes,
    List<double?> miercoles,
    List<double?> jueves,
    List<double?> viernes,
    List<double?> sabado,
    List<double?> domingo,
    String sesId,
    String pacienteId,
    String pacienteSesId,
  ) {
    _progresoRepo.progresAdd(conducta, lunes, martes, miercoles, jueves,
        viernes, sabado, domingo, sesId, pacienteId, pacienteSesId);
  }

    @action
  editConducta(
    String conducta,
    List<double?> lunes,
    List<double?> martes,
    List<double?> miercoles,
    List<double?> jueves,
    List<double?> viernes,
    List<double?> sabado,
    List<double?> domingo,
    String sesId,
    String pacienteId,
    String pacienteSesId,
    String conductaId
  ) {
    _progresoRepo.editProgreso(conducta, lunes, martes, miercoles, jueves,
        viernes, sabado, domingo, sesId, pacienteId, pacienteSesId, conductaId);
  }

  @action
  deleteProgreso(String id) {
    _progresoRepo.deleteProgreso(id);
    print(id);
  }

  @observable
  List<ProgresoData>? progresoLista;
}
