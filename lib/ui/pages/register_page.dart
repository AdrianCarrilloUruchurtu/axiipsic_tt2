import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:axiipsic_tt2/login_state.dart';
import 'package:axiipsic_tt2/ui/pages/home/patient_home_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  final bool _loggedIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Image.asset(
            "assets/logo/logo.png",
            color: Colors.black,
            height: 200,
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -40),
          child: Center(
            child: SingleChildScrollView(
              child: Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 260, bottom: 20),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Nombre: ",
                            icon: Icon(
                              Icons.person,
                              color: Colors.blue,
                            )),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText:
                                "Correo electrónico o nombre de usuario: ",
                            icon: Icon(Icons.email)),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Tipo de usuario: ",
                            icon: Icon(
                              Icons.person_outline_outlined,
                              color: Colors.blue,
                            )),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Contraseña: ",
                            icon: Icon(
                              Icons.password,
                              color: Colors.blue,
                            )),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      Theme(
                        data: Theme.of(context)
                            .copyWith(selectedRowColor: Colors.white),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20),
                              DecoratedBox(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60)),
                                  child: const Text("Continuar")),

                              if (_loggedIn)
                                Container(
                                  height: 20,
                                  width: 20,
                                  margin: const EdgeInsets.only(left: 20),
                                  child: const CircularProgressIndicator(),
                                )
                            ],
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, 'login');
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("¿Google?"),
                          TextButton(
                            child: Text("Google"),
                            onPressed: () {
                              context.read<LoginState>().login();
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

  void _showRegister(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/register',
    );
  }
}
