import 'package:axiipsic_tt2/services/global_method.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:axiipsic_tt2/login_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //Variables para los forms
  final _formKey = GlobalKey<FormState>();
  final bool _loggedIn = true;
  bool _obscureText = true;
  //FocusNodes
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _nombreFocusNode = FocusNode();
  final FocusNode _apellidoFocusNode = FocusNode();
  //Campos
  String? _nombre = '';
  String? _apellido = '';
  String? _email = '';
  bool? _type = false;
  String? _password = '';

  GlobalMethod _globalMethod = GlobalMethod();

  bool _isLoading = false;

  // Variables Firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final dbRef = FirebaseDatabase.instance.ref().child('users');

  void dispose() {
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    _nombreFocusNode.dispose();
    _apellidoFocusNode.dispose();
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


      // Authenticate and error handling
      try {
        if(_type==true){

        }
        _auth
            .createUserWithEmailAndPassword(
                email: _email!.toLowerCase().trim(),
                password: _password!.trim())
            .then((value) => Navigator.popAndPushNamed(context, '/login'));
        // Añadir los detalles del usuario
        addUserDetails(_nombre!,_apellido! ,_type!, _email!);
      } catch (error) {
        _globalMethod.authErrorHandle("Hola", context);
        print('error occured $error');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future addUserDetails(String nombre, String apellido, bool tipo, String email) async{
    await FirebaseFirestore.instance.collection('usuarios').add({
      'nombre': nombre,
      'apellido': apellido,
      'tipo': tipo,
      'email': email
    });
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
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //nombre FormField
                        TextFormField(
                          key: ValueKey('nombre'),
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
                          key: ValueKey('apellido'),
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
                        //email FormField
                        TextFormField(
                          key: ValueKey('email'),
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
                        //Tipo de usuario FormField
                        FormField<bool>(
                          builder: (FormFieldState<bool> state) {
                            return  InputDecorator(
                              decoration: const InputDecoration(
                                  hintText: "Tipo de usuario",
                                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16),
                                  border: OutlineInputBorder(),
                                  icon: Icon(
                                    Icons.person_outline_outlined,
                                    color: Colors.blue,
                                  )),
                              child: DropdownButtonHideUnderline(child: DropdownButton<bool>(
                                value: _type,
                                isDense: true,
                                onChanged: (bool? newValue){
                                  setState(() {
                                    _type = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                isExpanded: true,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("Psicólogo"),
                                    value: true,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Paciente"),
                                    value: false,
                                  ),
                                ],
                              )),
                            );
                          },

                          key: ValueKey('utype'),
                          onSaved: (value) {
                            _type = value;
                          },
                        ),
                        const SizedBox(height: 20),
                        //Contraseña FormField
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
                          data: Theme.of(context)
                              .copyWith(selectedRowColor: Colors.white),
                          child: _isLoading
                              ? CircularProgressIndicator()
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
