import 'package:axiipsic_tt2/ui/pages/usuarios/view/notas/model/note_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import 'package:axiipsic_tt2/lib/get_it.dart';
import '../../../../../../services/nota_repo.dart';
part 'notaMobx.g.dart';

@injectable
class NotaStore = _NotaStoreBase with _$NotaStore;

abstract class _NotaStoreBase with Store {
  final _NotaRepo = getIt.get<NotaRepo>();

  _NotaStoreBase();

  @observable
  List<NotaData>? notaList;
}
