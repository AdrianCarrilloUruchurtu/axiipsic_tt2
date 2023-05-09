import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/services/global_method.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../routes/router.gr.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Variables para los forms
  final _formKey = GlobalKey<FormState>();
  final bool _loggedIn = true;
  final bool _obscureText = true;
  late bool _isLinked = false;

  //FocusNodes
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _nombreFocusNode = FocusNode();
  final FocusNode _apellidoFocusNode = FocusNode();
  final FocusNode _linkFocusNode = FocusNode();

  //Campos
  String? _nombre = '';
  String? _apellido = '';
  String? _email = '';
  String? _isPsic = "";
  String? _password = '';
  String? _psicMail = '';

  final GlobalMethod _globalMethod = GlobalMethod();

  bool _isLoading = false;

  // Variables Firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final dbRef = FirebaseDatabase.instance.ref().child('users');

  @override
  void dispose() {
    super.dispose();
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    _nombreFocusNode.dispose();
    _apellidoFocusNode.dispose();
    _linkFocusNode.dispose();
  }

  // Acción del botón
  void _submitForm() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState?.save();
      // Autenticar y manejo de errores
      try {
        _auth
            .createUserWithEmailAndPassword(
                email: _email!.toLowerCase().trim(),
                password: _password!.trim())
            .then((value) => {
                  addUserDetails(
                      _nombre!, _apellido!, _isPsic!, _email!, _psicMail!)
                });
      } catch (error) {
        _globalMethod.authErrorHandle(
            "Revisa que los campos estén llenados", context);
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future addUserDetails(String nombre, String apellido, String isPsic,
      String email, String psicMail) async {
    var user = _auth.currentUser;
    await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
      'nombre': nombre,
      'apellido': apellido,
      'ispsic': isPsic,
      'email': email,
      'psicMail': psicMail,
      'id': user.uid
    });
    // ignore: use_build_context_synchronously
    AutoRouter.of(context).push(const LoginRoute());
  }

  checkIfLinkedPat() {
    _isLinked = true;
    return _isLinked;
  }

  checkIfLinkedPsi() {
    _isLinked = false;
    return _isLinked;
  }

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
          //Logo
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
              //Tarjeta para los forms
              child: Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 260, bottom: 20),
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Nombre FormField
                        TextFormField(
                          key: const ValueKey('nombre'),
                          focusNode: _nombreFocusNode,
                          validator: (value) {
                            if ((value!.isEmpty)) {
                              return 'El nombre es requerido';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_apellidoFocusNode),
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              hintText: "Nombre: ",
                              icon: Icon(
                                Icons.person,
                                color: Colors.blue,
                              )),
                          onSaved: (value) {
                            _nombre = value;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Apellido FormField
                        TextFormField(
                          key: const ValueKey('apellido'),
                          focusNode: _apellidoFocusNode,
                          validator: (value) {
                            if ((value!.isEmpty)) {
                              return 'El apellido es requerido';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_emailFocusNode),
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              hintText: "Apellido: ",
                              icon: Icon(
                                Icons.person,
                                color: Colors.blue,
                              )),
                          onSaved: (value) {
                            _apellido = value;
                          },
                        ),
                        const SizedBox(height: 20),
                        // email FormField
                        TextFormField(
                          key: const ValueKey('email'),
                          focusNode: _emailFocusNode,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'El correo es requerido';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_apellidoFocusNode),
                          decoration: const InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: Colors.blue,
                              ),
                              hintText: "e-mail: "),
                          onSaved: (value) {
                            _email = value;
                          },
                        ),
                        const SizedBox(height: 20),

                        // Tipo de usuario FormField
                        FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: const InputDecoration(
                                  hintText: "Tipo de usuario",
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 16),
                                  border: OutlineInputBorder(),
                                  icon: Icon(
                                    Icons.person_outline_outlined,
                                    color: Colors.blue,
                                  )),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                value: _isPsic,
                                isDense: true,
                                onChanged: (String? newValue) {
                                  //setState, cambio con mobx?
                                  setState(() {
                                    _isPsic = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                isExpanded: true,
                                items: [
                                  const DropdownMenuItem(
                                    value: "",
                                    child: Text("Tipo de usuario"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Psicologo",
                                    onTap: checkIfLinkedPsi,
                                    child: const Text("Psicólogo"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Paciente",
                                    onTap: checkIfLinkedPat,
                                    child: const Text("Paciente"),
                                  ),
                                ],
                              )),
                            );
                          }, // Builder
                          validator: (value) {
                            if (value == "") {
                              const SnackBar(
                                content: Text("Tipo de usuario requerido"),
                              );
                            }
                            return null;
                          },
                          key: const ValueKey('utype'),
                          onSaved: (value) {
                            _isPsic = value;
                          },
                        ),
                        const SizedBox(height: 20),

                        // Prueba para esconder el formfield si el usuario es paciente, para que ingrese el código del psicólogo
                        Visibility(
                          visible: _isLinked,
                          child: TextFormField(
                            key: const ValueKey('psicMail'),
                            focusNode: _linkFocusNode,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'El mail del psicólogo es necesario para los pacientes';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_passwordFocusNode),
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.supervised_user_circle_outlined,
                                  color: Colors.blue,
                                ),
                                hintText: "Mail del psicólogo: "),
                            onSaved: (value) {
                              _psicMail = value;
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Contraseña FormField
                        TextFormField(
                          focusNode: _passwordFocusNode,
                          decoration: const InputDecoration(
                              hintText: "Contraseña: ",
                              icon: Icon(
                                Icons.password,
                                color: Colors.blue,
                              )),
                          obscureText: false,
                          onSaved: (value) {
                            _password = value;
                          },
                        ),
                        const SizedBox(height: 20),
                        Theme(
                          data: Theme.of(context).copyWith(),
                          child: _isLoading
                              ? const CircularProgressIndicator()
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(height: 20),
                                      DecoratedBox(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(60)),
                                          child: const Text("Continuar")),
                                      if (_loggedIn)
                                        Container(
                                          height: 20,
                                          width: 20,
                                          margin:
                                              const EdgeInsets.only(left: 20),
                                          child:
                                              const CircularProgressIndicator(),
                                        )
                                    ],
                                  ),
                                  onPressed: () {
                                    _submitForm();
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
