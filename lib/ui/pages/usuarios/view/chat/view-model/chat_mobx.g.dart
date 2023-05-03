// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatStore on _ChatStoreBase, Store {
  late final _$chatListAtom =
      Atom(name: '_ChatStoreBase.chatList', context: context);

  @override
  List<ChatData>? get chatList {
    _$chatListAtom.reportRead();
    return super.chatList;
  }

  @override
  set chatList(List<ChatData>? value) {
    _$chatListAtom.reportWrite(value, super.chatList, () {
      super.chatList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ChatStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$searchResultAtom =
      Atom(name: '_ChatStoreBase.searchResult', context: context);

  @override
  List<UserData>? get searchResult {
    _$searchResultAtom.reportRead();
    return super.searchResult;
  }

  @override
  set searchResult(List<UserData>? value) {
    _$searchResultAtom.reportWrite(value, super.searchResult, () {
      super.searchResult = value;
    });
  }

  late final _$onSearchAsyncAction =
      AsyncAction('_ChatStoreBase.onSearch', context: context);

  @override
  Future onSearch(String search) {
    return _$onSearchAsyncAction.run(() => super.onSearch(search));
  }

  late final _$_ChatStoreBaseActionController =
      ActionController(name: '_ChatStoreBase', context: context);

  @override
  dynamic streamChats(String friendId) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.streamChats');
    try {
      return super.streamChats(friendId);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
chatList: ${chatList},
isLoading: ${isLoading},
searchResult: ${searchResult}
    ''';
  }
}
