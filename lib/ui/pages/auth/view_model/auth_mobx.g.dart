// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthMobx on _AuthMobxBase, Store {
  late final _$userAtom = Atom(name: '_AuthMobxBase.user', context: context);

  @override
  UserData? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserData? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$userListaAtom =
      Atom(name: '_AuthMobxBase.userLista', context: context);

  @override
  List<UserData>? get userLista {
    _$userListaAtom.reportRead();
    return super.userLista;
  }

  @override
  set userLista(List<UserData>? value) {
    _$userListaAtom.reportWrite(value, super.userLista, () {
      super.userLista = value;
    });
  }

  late final _$psicListAtom =
      Atom(name: '_AuthMobxBase.psicList', context: context);

  @override
  List<UserData>? get psicList {
    _$psicListAtom.reportRead();
    return super.psicList;
  }

  @override
  set psicList(List<UserData>? value) {
    _$psicListAtom.reportWrite(value, super.psicList, () {
      super.psicList = value;
    });
  }

  late final _$_AuthMobxBaseActionController =
      ActionController(name: '_AuthMobxBase', context: context);

  @override
  dynamic signOut() {
    final _$actionInfo = _$_AuthMobxBaseActionController.startAction(
        name: '_AuthMobxBase.signOut');
    try {
      return super.signOut();
    } finally {
      _$_AuthMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getUserById(String? friendId) {
    final _$actionInfo = _$_AuthMobxBaseActionController.startAction(
        name: '_AuthMobxBase.getUserById');
    try {
      return super.getUserById(friendId);
    } finally {
      _$_AuthMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
userLista: ${userLista},
psicList: ${psicList}
    ''';
  }
}
