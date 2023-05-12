import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/pages/auth/model/user_data.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/progreso/model/progreso_model.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/progreso/view-model/progresoMobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/model/sesiones_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../style/app_style.dart';

class ConductaLectorPage extends StatefulWidget {
  const ConductaLectorPage(
      {super.key,
      required this.docProg,
      required this.docSes,
      required this.docPac});
  final ProgresoData docProg;
  final SesionesData docSes;
  final UserData? docPac;

  @override
  State<ConductaLectorPage> createState() => _ConductaLectorPageState();
}

class _ConductaLectorPageState extends State<ConductaLectorPage> {
  late final _progresoMobx = ProgresoStore(widget.docSes.id);
  final _conductaController = TextEditingController();
  List? _daysWeek = [
    "Lunes",
    "Martes",
    "Miércoles",
    "Jueves",
    "Viernes",
    "Sábado",
    "Domingo"
  ];
  late List<double?> _lunes;
  late List<double?> _martes;
  late List<double?> _miercoles;
  late List<double?> _jueves;
  late List<double?> _viernes;
  late List<double?> _sabado;
  late List<double?> _domingo;
  final daysForm = GlobalKey<FormState>();
  double? _conductaCantidad;
  late List<double?> _evaluacionConducta;

  @override
  void initState() {
    super.initState();
    _daysWeek = [
      "Lunes",
      "Martes",
      "Miércoles",
      "Jueves",
      "Viernes",
      "Sábado",
      "Domingo"
    ];
    _evaluacionConducta = [0, 0, 0, 0, 0, 0, 0];
    _lunes = [0, 0];
    _martes = [1, 0];
    _miercoles = [2, 0];
    _jueves = [3, 0];
    _viernes = [4, 0];
    _sabado = [5, 0];
    _domingo = [6, 0];
  }

  _saveDays() {
    if (_daysWeek!.contains("Lunes")) {
      setState(() {
        _lunes = [0, _evaluacionConducta[0]];
      });
    }
    if (_daysWeek!.contains("Martes")) {
      setState(() {
        _martes = [1, _evaluacionConducta[1]];
      });
    }
    if (_daysWeek!.contains("Miércoles")) {
      setState(() {
        _miercoles = [2, _evaluacionConducta[2]];
      });
    }
    if (_daysWeek!.contains("Jueves")) {
      setState(() {
        _jueves = [3, _evaluacionConducta[3]];
      });
    }
    if (_daysWeek!.contains("Viernes")) {
      setState(() {
        _viernes = [4, _evaluacionConducta[4]];
      });
    }
    if (_daysWeek!.contains("Sábado")) {
      setState(() {
        _sabado = [5, _evaluacionConducta[5]];
      });
    }
    if (_daysWeek!.contains("Domingo")) {
      setState(() {
        _domingo = [6, _evaluacionConducta[6]];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_conductaController.text == "") {
            setState(() {
              _conductaController.text = widget.docProg.conducta;
            });
          }
          _saveDays();
          _progresoMobx.editConducta(
              _conductaController.text,
              _lunes,
              _martes,
              _miercoles,
              _jueves,
              _viernes,
              _sabado,
              _domingo,
              widget.docSes.id,
              widget.docPac!.email,
              widget.docProg.id,
              widget.docProg.id);

          context.router.pop();
        },
        child: const Icon(
          Icons.save,
          size: 30,
        ),
      ),
      appBar: _appbar(),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _conductaController,
              maxLines: 1,
              decoration: InputDecoration(labelText: widget.docProg.conducta),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "¿Con qué frecuencia sucedió antes de esta sesión?",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              width: 20,
            ),
            // Form(
            //     key: daysForm,
            //     child: Column(
            //       children: [
            //         MultiSelectFormField(
            //           autovalidate: AutovalidateMode.disabled,
            //           chipBackGroundColor: Colors.blue,
            //           chipLabelStyle: const TextStyle(
            //               fontWeight: FontWeight.bold, color: Colors.white),
            //           dialogTextStyle:
            //               const TextStyle(fontWeight: FontWeight.bold),
            //           checkBoxActiveColor: Colors.blue,
            //           checkBoxCheckColor: Colors.white,
            //           dialogShapeBorder: const RoundedRectangleBorder(
            //               borderRadius:
            //                   BorderRadius.all(Radius.circular(12.0))),
            //           title: const Text(
            //             "Días que sucedió",
            //             style: TextStyle(fontSize: 16),
            //           ),
            //           validator: (value) {
            //             if (value == null || value.length == 0) {
            //               return "Por favor selecciona uno o más";
            //             }
            //             return null;
            //           },
            //           dataSource: const [
            //             {
            //               "display": "Lunes",
            //               "value": "Lunes",
            //             },
            //             {
            //               "display": "Martes",
            //               "value": "Martes",
            //             },
            //             {
            //               "display": "Miércoles",
            //               "value": "Miercoles",
            //             },
            //             {
            //               "display": "Jueves",
            //               "value": "Jueves",
            //             },
            //             {
            //               "display": "Viernes",
            //               "value": "Viernes",
            //             },
            //             {
            //               "display": "Sábado",
            //               "value": "Sábado",
            //             },
            //             {
            //               "display": "Domingo",
            //               "value": "Domingo",
            //             },
            //           ],
            //           textField: 'display',
            //           valueField: 'value',
            //           okButtonLabel: "OK",
            //           cancelButtonLabel: "Cancelar",
            //           hintWidget: const Text(
            //               "Selecciona los días en los que se repitió esta conducta"),
            //           initialValue: _daysWeek,
            //           onSaved: (value) {
            //             if (value == null) {
            //               return;
            //             }
            //             setState(() {
            //               _daysWeek = value;
            //             });
            //           },
            //         ),
            //       ],
            //     )),
            const SizedBox(
              height: 16,
            ),
            // const Text(
            //   "¿Cuántas veces sucedió en el día?",
            //   style: TextStyle(fontSize: 20),
            // ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: ((context, index) {
                  return _daysWeek!.isNotEmpty
                      ? SizedBox(
                          child: Card(
                            elevation: 5,
                            child: ListTile(
                              onTap: () {
                                _cantidadDialog(index);
                              },
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              tileColor: Colors.lightBlue[50],
                              leading: Container(
                                  padding: const EdgeInsets.only(right: 12),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                    width: 0.5,
                                    color: Colors.black54,
                                  ))),
                                  child: const Icon(
                                    Icons.psychology,
                                    color: Colors.black45,
                                    size: 30,
                                  )),
                              title: Text(
                                _daysWeek![index],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.arrow_drop_down_rounded,
                                  size: 40,
                                ),
                                onPressed: () {
                                  _cantidadDialog(index);
                                },
                              ),
                            ),
                          ),
                        )
                      : const CircularProgressIndicator();
                }),
                itemCount: _daysWeek!.length.toInt(),
              ),
            )
          ],
        ),
      ),
    );
  }

  _cantidadDialog(int index) {
    final addConducta = showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Cantidad"),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.repeat,
              size: 30,
            ),
            const SizedBox(
              width: 20,
            ),
            FormField(
              builder: ((state) {
                print("Miercoles: $_miercoles");
                print(_evaluacionConducta[index]);
                return DropdownButton(
                  value: _conductaCantidad,
                  items: const [
                    DropdownMenuItem(
                        value: 1.0,
                        child: Text(
                          "1",
                          style: TextStyle(fontSize: 30),
                        )),
                    DropdownMenuItem(
                      value: 2.0,
                      child: Text("2", style: TextStyle(fontSize: 30)),
                    ),
                    DropdownMenuItem(
                      value: 3.0,
                      child: Text("3", style: TextStyle(fontSize: 30)),
                    ),
                    DropdownMenuItem(
                      value: 4.0,
                      child: Text("4", style: TextStyle(fontSize: 30)),
                    ),
                    DropdownMenuItem(
                      value: 5.0,
                      child: Text("5", style: TextStyle(fontSize: 30)),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _conductaCantidad = value;
                      state.didChange(value);
                    });
                  },
                );
              }),
              onSaved: (double? newValue) => _conductaCantidad = newValue,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.router.pop();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              _evaluacionConducta[index] = _conductaCantidad;
              context.router.pop();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            child: const Text("Añadir"),
          ),
        ],
      ),
    );

    if (addConducta == true) {
      // _progresoMobx.addProgreso(_conductaNombre.text, [0], [evaluar]);
    }
  }

  // Appbar
  AppBar _appbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        widget.docProg.conducta,
        style: AppStyle.mainTitle,
        textAlign: TextAlign.center,
      ),
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
                  context.router.pop();
                },
              ));
        },
      ),
      elevation: 0,
    );
  }
}
