import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/services/tareas_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../model/tareas_model.dart';
part 'tarea_mobx.g.dart';

@injectable
class TareaStore = _TareaStoreBase with _$TareaStore;

abstract class _TareaStoreBase with Store {
  final _tareaRepo = getIt.get<TareasRepo>();

  _TareaStoreBase() {
    _tareaRepo.tareasChanges().listen((event) {
      tareaList = event;
    });
  }

  @action
  crearTarea(int colorId, String creationDate, String tareaContent,
      String tareaTitle, String pacienteId) {
    _tareaRepo.tareaAdd(
        colorId, creationDate, tareaContent, tareaTitle, pacienteId);
  }

  @observable
  List<TareasData>? tareaList;
}
