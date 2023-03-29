// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipsMobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TipsMobx on _TipsMobxBase, Store {
  late final _$tipListAtom =
      Atom(name: '_TipsMobxBase.tipList', context: context);

  @override
  List<TipsData>? get tipList {
    _$tipListAtom.reportRead();
    return super.tipList;
  }

  @override
  set tipList(List<TipsData>? value) {
    _$tipListAtom.reportWrite(value, super.tipList, () {
      super.tipList = value;
    });
  }

  @override
  String toString() {
    return '''
tipList: ${tipList}
    ''';
  }
}
