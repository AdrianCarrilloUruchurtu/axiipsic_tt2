import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:axiipsic_tt2/login_state.dart';
import 'package:axiipsic_tt2/ui/pages/home/patient_home_page.dart';

class Login extends StatelessWidget {
  Login({super.key});

  bool _loggedIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 70),
          decoration: BoxDecoration(
            color: Colors.transparent,
            gradient:
                LinearGradient(colors: [Colors.cyan[300]!, Colors.cyan[800]!]),
          ),
          child: Image.asset(
            "assets/logo/logo.png",
            color: Colors.black,
            height: 200,
          ),
        ),
        Transform.translate(
          offset: Offset(0, -40),
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
                        decoration:
                            const InputDecoration(labelText: "Usuario: "),
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: "Contraseña: "),
                        obscureText: true,
                      ),
                      SizedBox(height: 40),
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
                              DecoratedBox(decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60)
                              ),
                              child: Text("Iniciar sesión")),

                              if (_loggedIn)
                                Container(
                                  height: 20,
                                  width: 20,
                                  margin: const EdgeInsets.only(left: 20),
                                  child: CircularProgressIndicator(),
                                )
                            ],
                          ),
                          onPressed: () {
                           // context.read<LoginState>().login();
                          Navigator.of(context).pushNamed('/psicHome');
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("¿No estás registrado?"),
                          TextButton(
                            child: Text("Registrarse"),
                            onPressed: () {
                              _showRegister(context);
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

  void _showRegister(BuildContext context) {Navigator.of(context).pushNamed(
    '/register',
  );}
}
