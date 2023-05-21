import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view_model/auth_mobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/chat/view-model/chat_mobx.dart';
import 'package:axiipsic_tt2/ui/routes/router.gr.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

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
            body: ListView.builder(
                itemCount: _chatMobx.chatList?.length.toInt(),
                itemBuilder: (context, index) =>
                    Builder(builder: (BuildContext context) {
                      return _chatMobx.chatList != null
                          ? Container(
                              margin: const EdgeInsets.all(4),
                              padding: const EdgeInsets.all(4),
                              child: ListTile(
                                  leading: ProfilePicture(
                                      name:
                                          _chatMobx.chatList![index].friendName,
                                      radius: 20,
                                      fontsize: 15),
                                  title: Text(
                                      _chatMobx.chatList![index].friendName),
                                  subtitle: Text(
                                    _chatMobx.chatList![index].last_msg,
                                    style:
                                        const TextStyle(color: Colors.black54),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  onTap: () {
                                    context.router.push(ChatRoute(
                                        user: _authMobx.user,
                                        friendId:
                                            _chatMobx.chatList![index].friendId,
                                        friendName: _chatMobx
                                            .chatList![index].friendName));
                                  }),
                            )
                          : const LinearProgressIndicator();
                    })),
            floatingActionButton: Visibility(
              visible: _authMobx.user?.ispsic == 'Paciente' ? false : true,
              child: FloatingActionButton(
                child: const Icon(Icons.search),
                onPressed: () {
                  context.router.push(SearchRoute(user: _authMobx.user));
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => SearchScreen(widget.user)));
                },
              ),
            ),
          )),
    );
  }
}
