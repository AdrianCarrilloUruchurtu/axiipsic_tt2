import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/auth/model/user_data.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view_model/auth_mobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/chat/model/chat_model.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/chat/view-model/chat_mobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/chat/view/single_message.dart';
import 'package:flutter/material.dart';

import '../view-model/message_mobx.dart';
import 'message_textfield.dart';

class ChatPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final authMobx = getIt.get<AuthMobx>();
    final chatMobx = getIt.get<ChatStore>();
    final messageMobx = getIt.get<MessageStore>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
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
              user!.nombre,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: StreamBuilder<List<ChatData>>(
                stream: messageMobx.getMessages(user!.id),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.docs.length < 1) {
                      return const Center(
                        child: Text("Say Hi"),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        reverse: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          bool isMe = snapshot.data.docs[index]['senderId'] ==
                              authMobx.user?.id;
                          return SingleMessageItem(
                              message: snapshot.data.docs[index]['message'],
                              isMe: isMe);
                        });
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
          )),
          MessageTextField(user!.id, friendId),
        ],
      ),
    );
  }
}
