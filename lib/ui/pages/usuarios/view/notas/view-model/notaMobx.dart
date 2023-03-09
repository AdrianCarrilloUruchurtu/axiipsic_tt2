import 'package:axiipsic_tt2/ui/pages/usuarios/view/notas/model/note_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import 'package:axiipsic_tt2/lib/get_it.dart';
import '../../../../../../services/nota_repo.dart';
part 'notaMobx.g.dart';

@injectable
class NotaStore = _NotaStoreBase with _$NotaStore;

abstract class _NotaStoreBase with Store {
  final _notaRepo = getIt.get<NotaRepo>();

  _NotaStoreBase() {
    _notaRepo.noteChanges().listen((event) {
      notaList = event;
    });
  }

  @action
  crearNota(
      int colorId, String creationDate, String noteContent, String noteTitle) {
    _notaRepo.notaEdit(colorId, creationDate, noteContent, noteTitle);
  }

  @observable
  List<NotaData>? notaList;
}
