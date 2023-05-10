// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historia_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoriaStore on _HistoriaStoreBase, Store {
  late final _$historiaListAtom =
      Atom(name: '_HistoriaStoreBase.historiaList', context: context);

  @override
  List<HistoriaData>? get historiaList {
    _$historiaListAtom.reportRead();
    return super.historiaList;
  }

  @override
  set historiaList(List<HistoriaData>? value) {
    _$historiaListAtom.reportWrite(value, super.historiaList, () {
      super.historiaList = value;
    });
  }

  late final _$_HistoriaStoreBaseActionController =
      ActionController(name: '_HistoriaStoreBase', context: context);

  @override
  dynamic addHistoria(String edad, String estadoCivil, String escolaridad,
      String contacto, String motivo, String antecedentes) {
    final _$actionInfo = _$_HistoriaStoreBaseActionController.startAction(
        name: '_HistoriaStoreBase.addHistoria');
    try {
      return super.addHistoria(
          edad, estadoCivil, escolaridad, contacto, motivo, antecedentes);
    } finally {
      _$_HistoriaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
historiaList: ${historiaList}
    ''';
  }
}
