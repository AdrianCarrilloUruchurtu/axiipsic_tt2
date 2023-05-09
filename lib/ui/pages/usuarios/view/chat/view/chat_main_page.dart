import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view_model/auth_mobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/chat/view-model/chat_mobx.dart';
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
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: ((context) => Scaffold(
            body: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(_authMobx.user!.id)
                    .collection('messages')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Snapshot error"),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Text("Loading"),
                    );
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: _chatMobx.chatList?.length.toInt(),
                        itemBuilder: (context, index) =>
                            Builder(builder: (BuildContext context) {
                              return snapshot.hasData
                                  ? Container(
                                      margin: const EdgeInsets.all(4),
                                      padding: const EdgeInsets.all(4),
                                      child: ListTile(
                                          title: Text(_chatMobx
                                              .chatList![index].friendName),
                                          subtitle: Text(
                                            _chatMobx.chatList![index].last_msg,
                                            style: const TextStyle(
                                                color: Colors.black54),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          onTap: () {
                                            context.router.push(ChatRoute(
                                                user: _authMobx.user,
                                                friendId: _chatMobx
                                                    .chatList![index].friendId,
                                                friendName: _chatMobx
                                                    .chatList![index]
                                                    .friendName));
                                          }),
                                    )
                                  : const LinearProgressIndicator();
                            }));

                    // if (snapshot.data.docs.length < 1) {
                    //   return const Center(
                    //     child: Text("No has comenzado ningún chat"),
                    //   );
                    // }
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
