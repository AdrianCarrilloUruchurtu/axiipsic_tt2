// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarea_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TareaStore on _TareaStoreBase, Store {
  late final _$tareaListAtom =
      Atom(name: '_TareaStoreBase.tareaList', context: context);

  @override
  List<TareasData>? get tareaList {
    _$tareaListAtom.reportRead();
    return super.tareaList;
  }

  @override
  set tareaList(List<TareasData>? value) {
    _$tareaListAtom.reportWrite(value, super.tareaList, () {
      super.tareaList = value;
    });
  }

  late final _$_TareaStoreBaseActionController =
      ActionController(name: '_TareaStoreBase', context: context);

  @override
  dynamic crearTarea(int colorId, String creationDate, String tareaContent,
      String tareaTitle, String pacienteId) {
    final _$actionInfo = _$_TareaStoreBaseActionController.startAction(
        name: '_TareaStoreBase.crearTarea');
    try {
      return super.crearTarea(
          colorId, creationDate, tareaContent, tareaTitle, pacienteId);
    } finally {
      _$_TareaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tareaList: ${tareaList}
    ''';
  }
}
