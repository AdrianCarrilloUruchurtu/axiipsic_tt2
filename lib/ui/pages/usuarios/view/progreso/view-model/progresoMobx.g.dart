// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progresoMobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProgresoStore on _ProgresoStoreBase, Store {
  late final _$progresoListaAtom =
      Atom(name: '_ProgresoStoreBase.progresoLista', context: context);

  @override
  List<ProgresoData>? get progresoLista {
    _$progresoListaAtom.reportRead();
    return super.progresoLista;
  }

  @override
  set progresoLista(List<ProgresoData>? value) {
    _$progresoListaAtom.reportWrite(value, super.progresoLista, () {
      super.progresoLista = value;
    });
  }

  late final _$_ProgresoStoreBaseActionController =
      ActionController(name: '_ProgresoStoreBase', context: context);

  @override
  dynamic addProgreso(
      int colorId,
      String conducta,
      List<double?> lunes,
      List<double?> martes,
      List<double?> miercoles,
      List<double?> jueves,
      List<double?> viernes,
      List<double?> sabado,
      List<double?> domingo,
      String sesId,
      String pacienteId,
      String pacienteSesId) {
    final _$actionInfo = _$_ProgresoStoreBaseActionController.startAction(
        name: '_ProgresoStoreBase.addProgreso');
    try {
      return super.addProgreso(colorId, conducta, lunes, martes, miercoles,
          jueves, viernes, sabado, domingo, sesId, pacienteId, pacienteSesId);
    } finally {
      _$_ProgresoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addProgresoPac(
      int colorId,
      String conducta,
      List<double?> lunes,
      List<double?> martes,
      List<double?> miercoles,
      List<double?> jueves,
      List<double?> viernes,
      List<double?> sabado,
      List<double?> domingo,
      String sesId,
      String psicId,
      String psicSesId) {
    final _$actionInfo = _$_ProgresoStoreBaseActionController.startAction(
        name: '_ProgresoStoreBase.addProgresoPac');
    try {
      return super.addProgresoPac(colorId, conducta, lunes, martes, miercoles,
          jueves, viernes, sabado, domingo, sesId, psicId, psicSesId);
    } finally {
      _$_ProgresoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic editConducta(
      String conducta,
      List<double?> lunes,
      List<double?> martes,
      List<double?> miercoles,
      List<double?> jueves,
      List<double?> viernes,
      List<double?> sabado,
      List<double?> domingo,
      String sesId,
      String pacienteId,
      String pacienteSesId,
      String conductaId,
      String conductaPacId) {
    final _$actionInfo = _$_ProgresoStoreBaseActionController.startAction(
        name: '_ProgresoStoreBase.editConducta');
    try {
      return super.editConducta(
          conducta,
          lunes,
          martes,
          miercoles,
          jueves,
          viernes,
          sabado,
          domingo,
          sesId,
          pacienteId,
          pacienteSesId,
          conductaId,
          conductaPacId);
    } finally {
      _$_ProgresoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic editConductaPac(
      String conducta,
      List<double?> lunes,
      List<double?> martes,
      List<double?> miercoles,
      List<double?> jueves,
      List<double?> viernes,
      List<double?> sabado,
      List<double?> domingo,
      String sesId,
      String psicId,
      String psicSesId,
      String conductaId,
      String psicConductaId) {
    final _$actionInfo = _$_ProgresoStoreBaseActionController.startAction(
        name: '_ProgresoStoreBase.editConductaPac');
    try {
      return super.editConductaPac(
          conducta,
          lunes,
          martes,
          miercoles,
          jueves,
          viernes,
          sabado,
          domingo,
          sesId,
          psicId,
          psicSesId,
          conductaId,
          psicConductaId);
    } finally {
      _$_ProgresoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteProgreso(String id) {
    final _$actionInfo = _$_ProgresoStoreBaseActionController.startAction(
        name: '_ProgresoStoreBase.deleteProgreso');
    try {
      return super.deleteProgreso(id);
    } finally {
      _$_ProgresoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
progresoLista: ${progresoLista}
    ''';
  }
}
