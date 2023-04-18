import 'package:mobx/mobx.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import '../../../../../../services/tareas_repo.dart';
import '../model/tareas_model.dart';
import 'package:injectable/injectable.dart';
part 'tareasMobx.g.dart';

@injectable
class TareasStore = _TareasStoreBase with _$TareasStore;

abstract class _TareasStoreBase with Store {
  final _tareasRepo = getIt.get<TareasRepo>();

  _TareasStoreBase() {
    _tareasRepo.tareasChanges().listen((event) {
      tareasList = event;
    });
  }

  @action
  crearTarea(
      String title, String content, List<String> owners, String creationDate) {
    _tareasRepo.tareasAdd(title, content, owners, creationDate);
  }

  @observable
  List<TareasData>? tareasList;
}
