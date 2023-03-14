// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CalendarStore on _CalendarStoreBase, Store {
  late final _$calendarAtom =
      Atom(name: '_CalendarStoreBase.calendar', context: context);

  @override
  CalendarData? get calendar {
    _$calendarAtom.reportRead();
    return super.calendar;
  }

  @override
  set calendar(CalendarData? value) {
    _$calendarAtom.reportWrite(value, super.calendar, () {
      super.calendar = value;
    });
  }

  @override
  String toString() {
    return '''
calendar: ${calendar}
    ''';
  }
}
