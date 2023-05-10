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

  _HistoriaStoreBase() {
    _historiaRepo.historiaChanges().listen((event) {
      historiaList = event;
    });
  }

  @action
  addHistoria(String edad, String estadoCivil, String escolaridad,
      String contacto, String motivo, String antecedentes) {
    _historiaRepo.addHistoria(
        edad, estadoCivil, escolaridad, contacto, motivo, antecedentes);
  }

  @observable
  List<HistoriaData>? historiaList;
}
