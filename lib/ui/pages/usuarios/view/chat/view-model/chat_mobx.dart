import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/services/chat_repo.dart';
import 'package:axiipsic_tt2/services/user_repo.dart';
import 'package:axiipsic_tt2/ui/pages/auth/model/user_data.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/chat/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'chat_mobx.g.dart';

@injectable
class ChatStore = _ChatStoreBase with _$ChatStore;

abstract class _ChatStoreBase with Store {
  final _chatRepo = getIt.get<ChatRepo>();
  final _userRepo = getIt.get<UserRepo>();

  _ChatStoreBase() {
    _chatRepo.chatChanges().listen((event) {
      chatList = event;
    });
  }

  @action
  onSearch(String search) async {
    isLoading = true;
    searchResult?.clear();
    _userRepo.searchList(search).listen((event) {
      if (event.isEmpty) {
        const SnackBar(content: Text("No se encontraron usuarios"));
      } else {
        searchResult = event;
      }
      isLoading = false;
    });
  }

  @action
  getMensajes(String friendId) {
    _chatRepo.getMensajes(friendId);
  }

  @observable
  List<ChatData>? chatList;

  @observable
  bool isLoading = false;

  @observable
  List<UserData>? searchResult;
}
