import 'package:axiipsic_tt2/ui/pages/usuarios/view/notas/model/note_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import '../../../../../../services/nota_repo.dart';
part 'notaMobx.g.dart';

@injectable
class NotaStore = _NotaStoreBase with _$NotaStore;

abstract class _NotaStoreBase with Store {
  final _notaRepo = getIt.get<NotaRepo>();

  _NotaStoreBase(String sesId) {
    _notaRepo.noteChanges().listen((event) {
      notaList = event;
    });
    _notaRepo.sesionNote(sesId).listen((event) {
      notaSes = event;
    });
  }

  @action
  crearNota(int colorId, String creationDate, String noteContent,
      String noteTitle, String isses) {
    _notaRepo.notaEdit(colorId, creationDate, noteContent, noteTitle, isses);
  }

  @action
  eliminarNota(String id) async {
    return _notaRepo.deleteNota(id);
  }

  @observable
  List<NotaData>? notaList;

  @observable
  List<NotaData>? notaSes;
}
