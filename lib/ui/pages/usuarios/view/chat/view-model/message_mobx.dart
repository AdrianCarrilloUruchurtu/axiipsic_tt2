import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/services/message_repo.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/chat/model/message_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'message_mobx.g.dart';

@injectable
class MessageStore = _MessageStoreBase with _$MessageStore;

abstract class _MessageStoreBase with Store {
  final _messageRepo = getIt.get<MessageRepo>();

  _MessageStoreBase(String friendId) {
    _messageRepo.messageChanges().listen((event) {
      messageList = event;
    });
    _messageRepo.getMessages(friendId).listen((event) {
      chatMessages = event;
    });
  }

  @action
  onSavedMessage(String friendId, String message, String friendName) {
    _messageRepo.currentUserOnMessageSent(friendId, message, friendName);
    _messageRepo.friendUserOnMessageSent(friendId, message, friendName);
  }

  @observable
  List<MessageData>? messageList;

  @observable
  List<MessageData>? chatMessages;
}
