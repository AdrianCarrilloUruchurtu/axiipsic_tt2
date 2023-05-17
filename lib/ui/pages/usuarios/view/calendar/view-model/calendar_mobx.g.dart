// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CalendarStore on _CalendarStoreBase, Store {
  late final _$eventListAtom =
      Atom(name: '_CalendarStoreBase.eventList', context: context);

  @override
  List<CalendarData>? get eventList {
    _$eventListAtom.reportRead();
    return super.eventList;
  }

  @override
  set eventList(List<CalendarData>? value) {
    _$eventListAtom.reportWrite(value, super.eventList, () {
      super.eventList = value;
    });
  }

  late final _$leerEventoAsyncAction =
      AsyncAction('_CalendarStoreBase.leerEvento', context: context);

  @override
  Future leerEvento() {
    return _$leerEventoAsyncAction.run(() => super.leerEvento());
  }

  late final _$eliminarEventoAsyncAction =
      AsyncAction('_CalendarStoreBase.eliminarEvento', context: context);

  @override
  Future eliminarEvento(String id) {
    return _$eliminarEventoAsyncAction.run(() => super.eliminarEvento(id));
  }

  late final _$_CalendarStoreBaseActionController =
      ActionController(name: '_CalendarStoreBase', context: context);

  @override
  dynamic crearEvento(DateTime date, String title, String description,
      String time, String pacName) {
    final _$actionInfo = _$_CalendarStoreBaseActionController.startAction(
        name: '_CalendarStoreBase.crearEvento');
    try {
      return super.crearEvento(date, title, description, time, pacName);
    } finally {
      _$_CalendarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic crearEventoPaciente(DateTime date, String title, String description,
      String time, String pacId, String pacName) {
    final _$actionInfo = _$_CalendarStoreBaseActionController.startAction(
        name: '_CalendarStoreBase.crearEventoPaciente');
    try {
      return super
          .crearEventoPaciente(date, title, description, time, pacId, pacName);
    } finally {
      _$_CalendarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
eventList: ${eventList}
    ''';
  }
}
