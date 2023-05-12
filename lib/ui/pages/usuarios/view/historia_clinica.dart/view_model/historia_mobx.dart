import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/services/historia_repo.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/historia_clinica.dart/model/historia_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'historia_mobx.g.dart';

@injectable
class HistoriaStore = _HistoriaStoreBase with _$HistoriaStore;

abstract class _HistoriaStoreBase with Store {
  final _historiaRepo = getIt.get<HistoriaRepo>();

  _HistoriaStoreBase(String id) {
    _historiaRepo.historiaChanges(id).listen((event) {
      historia = event.single;
    });
  }

  @action
  addHistoria(
      String edad,
      String estadoCivil,
      String escolaridad,
      String nombreContacto,
      String telefonoContacto,
      String motivo,
      String antecedentes,
      bool isCompleted) {
    _historiaRepo.addHistoria(edad, estadoCivil, escolaridad, nombreContacto,
        telefonoContacto, motivo, antecedentes, isCompleted);
  }

  @observable
  List<HistoriaData>? historiaList;

  @observable
  HistoriaData? historia;
}
