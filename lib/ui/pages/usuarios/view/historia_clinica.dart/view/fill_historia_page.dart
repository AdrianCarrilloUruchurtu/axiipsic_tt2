import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/historia_clinica.dart/view_model/historia_mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FillHistoriaPage extends StatefulWidget {
  const FillHistoriaPage({super.key});

  @override
  State<FillHistoriaPage> createState() => _FillHistoriaPageState();
}

class _FillHistoriaPageState extends State<FillHistoriaPage> {
  final _formKey = GlobalKey<FormState>();
  final _historiaMobx = HistoriaStore(FirebaseAuth.instance.currentUser!.uid);

  //FocusNodes
  final FocusNode _edadFocusNode = FocusNode();
  final FocusNode _estadoCivilFocusNode = FocusNode();
  final FocusNode _escolaridadFocusNode = FocusNode();
  final FocusNode _nombreContactoFocusNode = FocusNode();
  final FocusNode _telefonoContactoFocusNode = FocusNode();
  final FocusNode _motivoFocusNode = FocusNode();
  final FocusNode _antecedenteFocusNode = FocusNode();
  final FocusNode _emailFocuseNode = FocusNode();

  //Campos
  String? _edad = "";
  String? _estadoCivil = '';
  String? _escolaridad = '';
  String? _nombreContacto = "";
  String? _telefonoContacto = "";
  String _motivo = '';
  String _antecedente = '';
  String _email = '';

  @override
  void dispose() {
    super.dispose();
    _edadFocusNode.dispose();
    _estadoCivilFocusNode.dispose();
    _escolaridadFocusNode.dispose();
    _nombreContactoFocusNode.dispose();
    _telefonoContactoFocusNode.dispose();
    _motivoFocusNode.dispose();
    _antecedenteFocusNode.dispose();
    _emailFocuseNode.dispose();
  }

  _submitForm() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _historiaMobx.addHistoria(_edad!, _estadoCivil!, _escolaridad!,
          _nombreContacto!, _telefonoContacto!, _motivo, _antecedente, true);
      context.router.pop();
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update(({'psicMail': _email}));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Llena los campos antes de continuar")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => context.router.pop(),
        ),
        elevation: 0,
        title: const Text(
          'Termina de llenar tus datos',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          //Tarjeta para los forms
          child: Card(
            color: Colors.white,
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      key: const ValueKey("psicmail"),
                      focusNode: _emailFocuseNode,
                      validator: (value) {
                        if ((value!.isEmpty)) {
                          return 'El email del psicólogo que escogiste es requerido';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(_edadFocusNode),
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: "Correo del psicólogo: ",
                          icon: Icon(
                            Icons.perm_scan_wifi,
                            color: Colors.blue,
                          )),
                      onChanged: (value) {
                        _email = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Nombre FormField
                    TextFormField(
                      key: const ValueKey(0),
                      focusNode: _edadFocusNode,
                      validator: (value) {
                        if ((value!.isEmpty)) {
                          return 'La edad es requerida';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_estadoCivilFocusNode),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: "Edad: ",
                          icon: Icon(
                            Icons.timelapse_sharp,
                            color: Colors.blue,
                          )),
                      onChanged: (value) {
                        _edad = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Apellido FormField
                    TextFormField(
                      key: const ValueKey('estadoCivil'),
                      focusNode: _estadoCivilFocusNode,
                      validator: (value) {
                        if ((value!.isEmpty)) {
                          return 'El estado civil es requerido';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_escolaridadFocusNode),
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: "Estado Civil: ",
                          icon: Icon(
                            Icons.co_present_outlined,
                            color: Colors.blue,
                          )),
                      onChanged: (value) {
                        _estadoCivil = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    // email FormField
                    TextFormField(
                      key: const ValueKey('escolaridad'),
                      focusNode: _escolaridadFocusNode,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'La escolaridad es requerida';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_nombreContactoFocusNode),
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.blue,
                          ),
                          hintText: "Escolaridad: "),
                      onChanged: (value) {
                        _escolaridad = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      focusNode: _nombreContactoFocusNode,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_telefonoContactoFocusNode),
                      decoration: const InputDecoration(
                          hintText: "Nombre del contacto de emergencia: ",
                          icon: Icon(
                            Icons.contact_page_rounded,
                            color: Colors.blue,
                          )),
                      obscureText: false,
                      onChanged: (value) {
                        _nombreContacto = value;
                      },
                    ),

                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(_motivoFocusNode),
                      focusNode: _telefonoContactoFocusNode,
                      decoration: const InputDecoration(
                          hintText: "Teléfono del contacto de emergencia: ",
                          icon: Icon(
                            Icons.contact_phone_rounded,
                            color: Colors.blue,
                          )),
                      obscureText: false,
                      onChanged: (value) {
                        _telefonoContacto = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      maxLines: 5,
                      focusNode: _motivoFocusNode,
                      decoration: const InputDecoration(
                          hintText:
                              "Razón por la que buscas ayuda psicológica: ",
                          icon: Icon(
                            Icons.psychology_outlined,
                            color: Colors.blue,
                          )),
                      obscureText: false,
                      onChanged: (value) {
                        _motivo = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      maxLines: 5,
                      focusNode: _antecedenteFocusNode,
                      decoration: const InputDecoration(
                          hintText:
                              "Antecedentes de tu familia en el ámbito psicólogico: ",
                          icon: Icon(
                            Icons.psychology_outlined,
                            color: Colors.blue,
                          )),
                      obscureText: false,
                      onChanged: (value) {
                        _antecedente = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
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
                              child: const Text("Enviar")),
                        ],
                      ),
                      onPressed: () {
                        _submitForm();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
