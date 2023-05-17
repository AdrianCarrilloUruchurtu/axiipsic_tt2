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
    int colorId,
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
    _progresoRepo.progresAdd(colorId, conducta, lunes, martes, miercoles,
        jueves, viernes, sabado, domingo, sesId, pacienteId, pacienteSesId);
  }

  @action
  addProgresoPac(
    int colorId,
    String conducta,
    List<double?> lunes,
    List<double?> martes,
    List<double?> miercoles,
    List<double?> jueves,
    List<double?> viernes,
    List<double?> sabado,
    List<double?> domingo,
    String sesId,
    String psicId,
    String psicSesId,
  ) {
    _progresoRepo.progresAdd(colorId, conducta, lunes, martes, miercoles,
        jueves, viernes, sabado, domingo, sesId, psicId, psicSesId);
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
      String conductaId,
      String conductaPacId) {
    _progresoRepo.editProgreso(
        conducta,
        lunes,
        martes,
        miercoles,
        jueves,
        viernes,
        sabado,
        domingo,
        sesId,
        pacienteId,
        pacienteSesId,
        conductaId,
        conductaPacId);
  }

  @action
  editConductaPac(
      String conducta,
      List<double?> lunes,
      List<double?> martes,
      List<double?> miercoles,
      List<double?> jueves,
      List<double?> viernes,
      List<double?> sabado,
      List<double?> domingo,
      String sesId,
      String psicId,
      String psicSesId,
      String conductaId,
      String psicConductaId) {
    _progresoRepo.editProgresoPac(
        conducta,
        lunes,
        martes,
        miercoles,
        jueves,
        viernes,
        sabado,
        domingo,
        sesId,
        psicId,
        psicSesId,
        conductaId,
        psicConductaId);
  }

  @action
  deleteProgreso(String id) {
    _progresoRepo.deleteProgreso(id);
    print(id);
  }

  @observable
  List<ProgresoData>? progresoLista;
}
