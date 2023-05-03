import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/auth/model/user_data.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view_model/auth_mobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/chat/view-model/chat_mobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/chat/view/search_item.dart';
import 'package:axiipsic_tt2/ui/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:auto_route/auto_route.dart';

class SearchPage extends StatefulWidget {
  const SearchPage(this.user, {super.key});
  final UserData? user;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _chatMobx = getIt.get<ChatStore>();
  final _authMobx = getIt.get<AuthMobx>();

  TextEditingController searchController = TextEditingController();

// No usar
  // void onSearch() async {
  //   setState(() {
  //     searchResult = [];
  //     isLoading = true;
  //   });

  //   _chatMobx.onSearch(searchController.text);
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .where("name", isEqualTo: searchController.text)
  //       .get()
  //       .then((value) {
  //     if (value.docs.isEmpty) {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(const SnackBar(content: Text("No User Found")));
  //       setState(() {
  //         isLoading = false;
  //       });
  //       return;
  //     }
  //     for (var user in value.docs) {
  //       if (user.data()['email'] != widget.user.email) {
  //         searchResult.add(user.data());
  //       }
  //     }
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: ((context) => Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: AppBar(
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.lightBlue,
                    ),
                    color: Colors.black,
                    onPressed: (() => context.router.pop()),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.lightBlue,
                          ),
                          focusColor: Colors.black,
                          hintText:
                              "Ingresa el nombre de un paciente o psicólogo",
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          )),
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                      textAlign: TextAlign.justify,
                      onChanged: _chatMobx.onSearch,
                    ),
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 200,
                        child: ListView.builder(
                            itemBuilder: ((context, index) =>
                                Builder(builder: (BuildContext context) {
                                  return _chatMobx.searchResult?[index] != null
                                      ? SearchItem(
                                          doc: _chatMobx.searchResult?[index],
                                          onTap: () {
                                            context.router.push(ChatRoute(
                                                user: _authMobx.user,
                                                friendId: widget.user!.id,
                                                friendName: widget.user!.nombre,));
                                          })
                                      : const Center(
                                          child: CircularProgressIndicator());
                                })),
                            itemCount: _chatMobx.searchResult?.length.toInt()),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
