import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/auth/model/user_data.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view_model/auth_mobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/chat/view-model/chat_mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../view-model/message_mobx.dart';

class ChatPage extends StatefulWidget {
  final UserData? user;
  final String friendId;
  final String friendName;

  const ChatPage({
    super.key,
    required this.user,
    required this.friendId,
    required this.friendName,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _authMobx = getIt.get<AuthMobx>();

  //Checar si ya hay un chat entre ellos
  @override
  void initState() {
    super.initState();
    CollectionReference chats = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.user?.id)
        .collection('messages')
        .doc(widget.friendId)
        .collection('chats');
  }

  @override
  Widget build(BuildContext context) {
    final authMobx = getIt.get<AuthMobx>();
    final chatMobx = getIt.get<ChatStore>();
    final messageMobx = MessageStore(widget.friendId);

    return Observer(
        builder: (context) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: Container(
                margin: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
              elevation: 0,
              title: Row(
                children: [
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(80),
                  //   child: CachedNetworkImage(
                  //     imageUrl: friendImage,
                  //     placeholder: (conteext, url) =>
                  //         const CircularProgressIndicator(),
                  //     errorWidget: (context, url, error) => const Icon(
                  //       Icons.error,
                  //     ),
                  //     height: 40,
                  //   ),
                  // ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.friendName,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              ),
            ),
            body: Chat(
              l10n: const ChatL10nEn(
                  inputPlaceholder: 'Mensaje',
                  emptyChatPlaceholder: 'Aún no hay mensajes'),
              theme: const DefaultChatTheme(
                  receivedMessageBodyBoldTextStyle:
                      TextStyle(color: Colors.blueAccent),
                  receivedMessageBodyTextStyle: TextStyle(color: Colors.black),
                  primaryColor: Colors.blueAccent,
                  secondaryColor: Color.fromARGB(255, 241, 237, 237),
                  inputTextColor: Colors.black,
                  inputBackgroundColor: Colors.white,
                  emptyChatPlaceholderTextStyle: TextStyle()),
              inputOptions: const InputOptions(
                  sendButtonVisibilityMode: SendButtonVisibilityMode.always),
              messages: messageMobx.chatMessages!
                  .map((e) => types.TextMessage(
                        author: types.User(id: e.senderId),
                        id: Random().toString(),
                        text: e.message,
                      ))
                  .toList(),
              onSendPressed: (p0) => messageMobx.onSavedMessage(
                  widget.friendId, p0.text, widget.friendName),
              user: types.User(id: FirebaseAuth.instance.currentUser!.uid),
            )));
  }
}
