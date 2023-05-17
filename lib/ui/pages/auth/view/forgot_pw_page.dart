import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  String _email = '';

  Future pwReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
      showDialog(
          context: context,
          builder: ((context) {
            return const AlertDialog(
              content: Text(
                  'Se ha enviado un link a tu correo para reestablecer tu contraseña'),
            );
          }));
    } on FirebaseAuthException {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Parece haber algún error con el correo'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => context.router.pop(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Ingresa tu correo para enviarte un vínculo de reestablecer contraseña',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              key: const ValueKey('email'),
              validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return 'Usuario o contraseña invalidos';
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  prefixIcon: Icon(Icons.email),
                  labelText: "email: "),
              onSaved: (value) {
                _email = value!;
              },
              onChanged: (value) => _email = value,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: pwReset,
            color: Colors.blue,
            child: const Text(
              'Reestabelecer contraseña',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
