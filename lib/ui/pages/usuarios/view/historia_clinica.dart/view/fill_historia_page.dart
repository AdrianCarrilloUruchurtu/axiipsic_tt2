import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/historia_clinica.dart/view_model/historia_mobx.dart';
import 'package:flutter/material.dart';

class FillHistoriaPage extends StatefulWidget {
  const FillHistoriaPage({super.key});

  @override
  State<FillHistoriaPage> createState() => _FillHistoriaPageState();
}

class _FillHistoriaPageState extends State<FillHistoriaPage> {
  final _formKey = GlobalKey<FormState>();
  final _historiaMobx = getIt.get<HistoriaStore>();

  //FocusNodes
  final FocusNode _edadFocusNode = FocusNode();
  final FocusNode _estadoCivilFocusNode = FocusNode();
  final FocusNode _escolaridadFocusNode = FocusNode();
  final FocusNode _nombreContactoFocusNode = FocusNode();
  final FocusNode _telefonoContactoFocusNode = FocusNode();
  final FocusNode _motivoFocusNode = FocusNode();
  final FocusNode _antecedenteFocusNode = FocusNode();

  //Campos
  String? _edad = '';
  String? _estadoCivil = '';
  String? _escolaridad = '';
  String? _nombreContacto = "";
  String? _telefonoContacto = "";
  String _motivo = '';
  String _antecedente = '';

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
  }

  _submitForm(String edad, String estadoCivil, String escolaridad,
      String contacto, String motivo, String antecedentes) {
    _historiaMobx.addHistoria(
        edad, estadoCivil, escolaridad, contacto, motivo, antecedentes);
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
                    // Nombre FormField
                    TextFormField(
                      key: const ValueKey('edad'),
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
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: "Edad: ",
                          icon: Icon(
                            Icons.timelapse_sharp,
                            color: Colors.blue,
                          )),
                      onSaved: (value) {
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
                      onSaved: (value) {
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
                      onSaved: (value) {
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
                      onSaved: (value) {
                        _nombreContacto = value;
                      },
                    ),

                    const SizedBox(height: 20),
                    TextFormField(
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
                      onSaved: (value) {
                        _telefonoContacto = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      focusNode: _motivoFocusNode,
                      decoration: const InputDecoration(
                          hintText:
                              "Razón por la que buscas ayuda psicológica: ",
                          icon: Icon(
                            Icons.psychology_outlined,
                            color: Colors.blue,
                          )),
                      obscureText: false,
                      onSaved: (value) {
                        _motivo = value!;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      focusNode: _antecedenteFocusNode,
                      decoration: const InputDecoration(
                          hintText:
                              "Antecedentes de tu familia en el ámbito psicólogico: ",
                          icon: Icon(
                            Icons.psychology_outlined,
                            color: Colors.blue,
                          )),
                      obscureText: false,
                      onSaved: (value) {
                        _antecedente = value!;
                      },
                    ),
                    ElevatedButton(
                        onPressed: _submitForm(
                            _edad!,
                            _estadoCivil!,
                            _escolaridad!,
                            _nombreContacto!,
                            _motivo,
                            _antecedente),
                        child: const Text("Si"))
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
