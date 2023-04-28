// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sesiones_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SesionesStore on _SesionesStoreBase, Store {
  late final _$sesionesListAtom =
      Atom(name: '_SesionesStoreBase.sesionesList', context: context);

  @override
  List<SesionesData>? get sesionesList {
    _$sesionesListAtom.reportRead();
    return super.sesionesList;
  }

  @override
  set sesionesList(List<SesionesData>? value) {
    _$sesionesListAtom.reportWrite(value, super.sesionesList, () {
      super.sesionesList = value;
    });
  }

  late final _$_SesionesStoreBaseActionController =
      ActionController(name: '_SesionesStoreBase', context: context);

  @override
  dynamic crearSesion(List<String> owners, String titulo, String descripcion,
      String date, String pacienteId, String time) {
    final _$actionInfo = _$_SesionesStoreBaseActionController.startAction(
        name: '_SesionesStoreBase.crearSesion');
    try {
      return super
          .crearSesion(owners, titulo, descripcion, date, pacienteId, time);
    } finally {
      _$_SesionesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteSesion(String id) {
    final _$actionInfo = _$_SesionesStoreBaseActionController.startAction(
        name: '_SesionesStoreBase.deleteSesion');
    try {
      return super.deleteSesion(id);
    } finally {
      _$_SesionesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sesionesList: ${sesionesList}
    ''';
  }
}
