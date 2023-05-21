import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import '../../../auth/view_model/auth_mobx.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthMobx _authMobx = getIt.get<AuthMobx>();
  String? _campo = '';
  bool _checkType() {
    bool isPsic = false;
    if (_authMobx.user?.ispsic == "Psicologo") {
      isPsic = true;
    }
    return isPsic;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => MaterialApp(
        home: Scaffold(
          appBar: _appbar(),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _profileImage(90),
                      Text(
                        _authMobx.user?.nombre ?? '',
                        style: const TextStyle(fontSize: 30),
                      ),
                      Text(
                        _authMobx.user?.apellido ?? '',
                        style: const TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 20.0,
                        width: 200,
                        child: Divider(
                          color: Colors.black54,
                        ),
                      ),
                      Visibility(
                          visible: _checkType(),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(8),
                                child: const Text(
                                  "Para vincular a tus pacientes comparte tu correo con ellos al momento de registrarse",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Column(
                                children: [
                                  TextFormField(
                                    key: const ValueKey('campo'),
                                    validator: (value) {
                                      if ((value!.isEmpty)) {
                                        return;
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.next,
                                    // onEditingComplete: () => FocusScope.of(context)
                                    //     .requestFocus(_emailFocusNode),
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(
                                        hintText: "Área de intervención: ",
                                        icon: Icon(
                                          Icons.person,
                                          color: Colors.blue,
                                        )),
                                    onSaved: (value) {
                                      _campo = value;
                                    },
                                    onChanged: (value) => _campo = value,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        _authMobx.addCampo(_campo);
                                      },
                                      child: const Text("Actualizar"))
                                ],
                              ),
                            ],
                          )),
                      Card(
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 25.0),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(4),
                            leading: Icon(
                              Icons.mail,
                              color: Colors.teal[900],
                            ),
                            title: const Text(
                              "Correo: ",
                              style: TextStyle(
                                  fontFamily: 'BalooBhai', fontSize: 20.0),
                            ),
                            subtitle: Text(
                              _authMobx.user?.email ?? '',
                              style: const TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            _signOut();
                          },
                          child: const Text("Cerrar sesión"))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Appbar
  AppBar _appbar() {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return Container(
              margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  context.popRoute();
                },
              ));
        },
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  // Imagen del perfil del usuario
  Widget _profileImage(double? size) {
    return ProfilePicture(
      name: '${_authMobx.user?.nombre} ${_authMobx.user?.apellido}',
      radius: size!,
      fontsize: size,
    );
  }

  void _signOut() async {
    _authMobx.signOut();
    context.router.popAndPush(const LoginRoute());
  }
}
