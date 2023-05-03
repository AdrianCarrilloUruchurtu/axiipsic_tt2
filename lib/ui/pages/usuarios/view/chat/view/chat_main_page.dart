import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view_model/auth_mobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/chat/view-model/chat_mobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/chat/view-model/message_mobx.dart';
import 'package:axiipsic_tt2/ui/routes/router.gr.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../auth/model/user_data.dart';

class ChatMainPage extends StatefulWidget {
  const ChatMainPage(this.user, {super.key});
  final UserData? user;

  @override
  State<ChatMainPage> createState() => _ChatMainPageState();
}

class _ChatMainPageState extends State<ChatMainPage> {
  final _chatMobx = getIt.get<ChatStore>();
  final _authMobx = getIt.get<AuthMobx>();
  final _messageMobx = getIt.get<MessageStore>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: ((context) => Scaffold(
            body: StreamBuilder(
                stream: _chatMobx.streamChats(widget.user!.id),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.docs.length < 1) {
                      return const Center(
                        child: Text("No Chats Available !"),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          var friendId = _authMobx.userLista?[index].id;
                          var lastMsg =
                              _messageMobx.messageList?[index].lastMsg;
                          return FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection('users')
                                .doc(friendId)
                                .get(),
                            builder: (context, AsyncSnapshot asyncSnapshot) {
                              if (asyncSnapshot.hasData) {
                                var friend = asyncSnapshot.data;
                                return ListTile(
                                  // Falta implementación de imagenes de perfil
                                  // leading: ClipRRect(
                                  //   borderRadius: BorderRadius.circular(80),
                                  //   child: CachedNetworkImage(
                                  //     imageUrl: friend['image'],
                                  //     placeholder: (conteext, url) =>
                                  //         const CircularProgressIndicator(),
                                  //     errorWidget: (context, url, error) =>
                                  //         const Icon(
                                  //       Icons.error,
                                  //     ),
                                  //     height: 50,
                                  //   ),
                                  // ),
                                  title: Text(friend['name']),
                                  subtitle: Container(
                                    child: Text(
                                      "$lastMsg",
                                      style:
                                          const TextStyle(color: Colors.grey),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => ChatScreen(
                                    //             currentUser: widget.user,
                                    //             friendId: friend['uid'],
                                    //             friendName: friend['name'],
                                    //             friendImage: friend['image'])));
                                  },
                                );
                              }
                              return const LinearProgressIndicator();
                            },
                          );
                        });
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.search),
              onPressed: () {
                context.router.push(SearchRoute(user: _authMobx.user));
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => SearchScreen(widget.user)));
              },
            ),
          )),
    );
  }
}
