// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MessageStore on _MessageStoreBase, Store {
  late final _$messageListAtom =
      Atom(name: '_MessageStoreBase.messageList', context: context);

  @override
  List<MessageData>? get messageList {
    _$messageListAtom.reportRead();
    return super.messageList;
  }

  @override
  set messageList(List<MessageData>? value) {
    _$messageListAtom.reportWrite(value, super.messageList, () {
      super.messageList = value;
    });
  }

  late final _$_MessageStoreBaseActionController =
      ActionController(name: '_MessageStoreBase', context: context);

  @override
  dynamic onSavedMessage(String friendId, String message) {
    final _$actionInfo = _$_MessageStoreBaseActionController.startAction(
        name: '_MessageStoreBase.onSavedMessage');
    try {
      return super.onSavedMessage(friendId, message);
    } finally {
      _$_MessageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getMessages(String friendId) {
    final _$actionInfo = _$_MessageStoreBaseActionController.startAction(
        name: '_MessageStoreBase.getMessages');
    try {
      return super.getMessages(friendId);
    } finally {
      _$_MessageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messageList: ${messageList}
    ''';
  }
}
