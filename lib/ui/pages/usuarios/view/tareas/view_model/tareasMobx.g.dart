// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tareasMobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TareasStore on _TareasStoreBase, Store {
  late final _$tareasListAtom =
      Atom(name: '_TareasStoreBase.tareasList', context: context);

  @override
  List<TareasData>? get tareasList {
    _$tareasListAtom.reportRead();
    return super.tareasList;
  }

  @override
  set tareasList(List<TareasData>? value) {
    _$tareasListAtom.reportWrite(value, super.tareasList, () {
      super.tareasList = value;
    });
  }

  late final _$_TareasStoreBaseActionController =
      ActionController(name: '_TareasStoreBase', context: context);

  @override
  dynamic crearTarea(
      String title, String content, List<String> owners, String creationDate) {
    final _$actionInfo = _$_TareasStoreBaseActionController.startAction(
        name: '_TareasStoreBase.crearTarea');
    try {
      return super.crearTarea(title, content, owners, creationDate);
    } finally {
      _$_TareasStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tareasList: ${tareasList}
    ''';
  }
}
