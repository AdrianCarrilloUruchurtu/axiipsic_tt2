import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view_model/auth_mobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/chat/view-model/chat_mobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/chat/view-model/message_mobx.dart';
import 'package:axiipsic_tt2/ui/routes/router.gr.dart';

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
                stream: _chatMobx.streamChats(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.docs.length < 1) {
                      return const Center(
                        child: Text("No has comenzado ningún chat"),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) =>
                            Builder(builder: (BuildContext context) {
                              return FutureBuilder(
                                  future: _authMobx.getUserById(
                                      _authMobx.userLista?[index].id),
                                  builder: (context, asyncSnapshot) {
                                    return asyncSnapshot.hasData
                                        ? ListTile(
                                            title: Text(_authMobx
                                                .userLista![index].nombre),
                                            subtitle: Container(
                                              child: Text(
                                                _chatMobx
                                                    .chatList![index].last_msg,
                                                style: const TextStyle(
                                                    color: Colors.grey),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            onTap: () {})
                                        : const LinearProgressIndicator();
                                  });
                            }));
                  } else {
                    return const Center(
                      child: Text("Hola"),
                    );
                  }
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
