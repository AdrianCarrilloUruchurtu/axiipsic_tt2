// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notaMobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotaStore on _NotaStoreBase, Store {
  late final _$notaListAtom =
      Atom(name: '_NotaStoreBase.notaList', context: context);

  @override
  List<NotaData>? get notaList {
    _$notaListAtom.reportRead();
    return super.notaList;
  }

  @override
  set notaList(List<NotaData>? value) {
    _$notaListAtom.reportWrite(value, super.notaList, () {
      super.notaList = value;
    });
  }

  late final _$notaSesAtom =
      Atom(name: '_NotaStoreBase.notaSes', context: context);

  @override
  List<NotaData>? get notaSes {
    _$notaSesAtom.reportRead();
    return super.notaSes;
  }

  @override
  set notaSes(List<NotaData>? value) {
    _$notaSesAtom.reportWrite(value, super.notaSes, () {
      super.notaSes = value;
    });
  }

  late final _$eliminarNotaAsyncAction =
      AsyncAction('_NotaStoreBase.eliminarNota', context: context);

  @override
  Future eliminarNota(String id) {
    return _$eliminarNotaAsyncAction.run(() => super.eliminarNota(id));
  }

  late final _$_NotaStoreBaseActionController =
      ActionController(name: '_NotaStoreBase', context: context);

  @override
  dynamic crearNota(int colorId, String creationDate, String noteContent,
      String noteTitle, String isses) {
    final _$actionInfo = _$_NotaStoreBaseActionController.startAction(
        name: '_NotaStoreBase.crearNota');
    try {
      return super
          .crearNota(colorId, creationDate, noteContent, noteTitle, isses);
    } finally {
      _$_NotaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notaList: ${notaList},
notaSes: ${notaSes}
    ''';
  }
}
