import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/services/message_repo.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/chat/model/message_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'message_mobx.g.dart';

class MessageStore = _MessageStoreBase with _$MessageStore;

@injectable
abstract class _MessageStoreBase with Store {
  final _messageRepo = getIt.get<MessageRepo>();

  _MessageStoreBase() {
    _messageRepo.messageChanges().listen((event) {
      messageList = event;
    });
  }

  @action
  onSavedMessage(String friendId, String message) {
    _messageRepo.currentUserOnMessageSent(friendId, message);
    _messageRepo.friendUserOnMessageSent(friendId, message);
  }

  @observable
  List<MessageData>? messageList;
}
