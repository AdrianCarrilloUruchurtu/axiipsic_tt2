import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view_model/auth_mobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/historia_clinica.dart/view_model/historia_mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../auth/model/user_data.dart';

class HistoriaPage extends StatefulWidget {
  const HistoriaPage({
    super.key,
    required this.pac,
  });
  final UserData? pac;

  @override
  State<HistoriaPage> createState() => _HistoriaPageState();
}

class _HistoriaPageState extends State<HistoriaPage> {
  final authMobx = getIt.get<AuthMobx>();
  late final historiaMobx = HistoriaStore(widget.pac!.id);
  @override
  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Scaffold(
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
                'Historia clínica',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: authMobx.userLista == null
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(8),
                    child: Card(
                      // Define the shape of the card
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      // Define how the card's content should be clipped
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      // Define the child widget of the card
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Add padding around the row widget
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Add an expanded widget to take up the remaining horizontal space
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // Add some spacing between the top of the card and the title
                                      const SizedBox(height: 5),
                                      // Add a title widget
                                      Center(
                                        child: Text(
                                          "${widget.pac!.nombre} ${widget.pac!.apellido}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                      ),
                                      // Add some spacing between the title and the subtitle
                                      Container(height: 5),
                                      // Add a subtitle widget
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color: Colors.grey.shade800,
                                                    fontSize: 15),
                                                children: [
                                                  const TextSpan(
                                                      text: "Nombre: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  TextSpan(
                                                      text:
                                                          "${widget.pac!.nombre} ${widget.pac!.apellido}")
                                                ]),
                                          ),
                                          const SizedBox(
                                            height: 9,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color: Colors.grey.shade800,
                                                    fontSize: 15),
                                                children: [
                                                  const TextSpan(
                                                      text: "Edad: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  TextSpan(
                                                      text: historiaMobx
                                                          .historia?.edad)
                                                ]),
                                          ),
                                          const SizedBox(
                                            height: 9,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color: Colors.grey.shade800,
                                                    fontSize: 15),
                                                children: [
                                                  const TextSpan(
                                                      text: "Estado civil: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  TextSpan(
                                                      text: historiaMobx
                                                          .historia
                                                          ?.estadoCivil)
                                                ]),
                                          ),
                                          const SizedBox(
                                            height: 9,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color: Colors.grey.shade800,
                                                    fontSize: 15),
                                                children: [
                                                  const TextSpan(
                                                      text: "Escolaridad: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  TextSpan(
                                                      text: historiaMobx
                                                          .historia
                                                          ?.escolaridad)
                                                ]),
                                          ),
                                          const SizedBox(
                                            height: 9,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color: Colors.grey.shade800,
                                                    fontSize: 15),
                                                children: [
                                                  const TextSpan(
                                                      text:
                                                          "En caso de emergencia comunicarse con: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  TextSpan(
                                                      text:
                                                          "${historiaMobx.historia?.nombreContacto} ${historiaMobx.historia?.telefonoContacto}")
                                                ]),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      // Add a title widget
                                      const Center(
                                        child: Text(
                                          "Motivo de la consulta",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                      ),
                                      const SizedBox(height: 7),
                                      Text(
                                        "${historiaMobx.historia?.motivo}",
                                        style: TextStyle(
                                            color: Colors.grey.shade800,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(height: 17),
                                      // Add a title widget
                                      const Center(
                                        child: Text(
                                          "Antecedentes",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                      ),
                                      const SizedBox(height: 7),
                                      Text(
                                        "${historiaMobx.historia?.antecedentes}",
                                        style: TextStyle(
                                            color: Colors.grey.shade800,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )));
  }
}
