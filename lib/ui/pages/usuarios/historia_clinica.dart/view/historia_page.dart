import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view_model/auth_mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../auth/model/user_data.dart';

class HistoriaPage extends StatelessWidget {
  const HistoriaPage({
    super.key,
    required this.pac,
  });
  final UserData? pac;

  @override
  Widget build(BuildContext context) {
    final authMobx = getIt.get<AuthMobx>();
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
          'Historia clínica',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Observer(
        builder: (_) {
          if (authMobx.userLista == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(8),
              child: _patientInfoCard(),
            );
          }
        },
      ),
    );
  }

  _patientInfoCard() {
    return Card(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Add some spacing between the top of the card and the title
                      const SizedBox(height: 5),
                      // Add a title widget
                      Center(
                        child: Text(
                          "${pac!.nombre} ${pac!.apellido}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                      ),
                      // Add some spacing between the title and the subtitle
                      Container(height: 5),
                      // Add a subtitle widget
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nombre: ${pac!.nombre} ${pac!.apellido}",
                            style: TextStyle(
                                color: Colors.grey.shade800, fontSize: 13),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Text(
                            "Edad: ${pac!.nombre}",
                            style: TextStyle(
                                color: Colors.grey.shade800, fontSize: 13),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Text(
                            "Estado civil: ${pac!.nombre}",
                            style: TextStyle(
                                color: Colors.grey.shade800, fontSize: 13),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Text(
                            "Escolaridad: ${pac!.nombre}",
                            style: TextStyle(
                                color: Colors.grey.shade800, fontSize: 13),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Text(
                            "En caso de emergencia comunicarse con: ${pac!.nombre}",
                            style: TextStyle(
                                color: Colors.grey.shade800, fontSize: 13),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Add a title widget
                      const Center(
                        child: Text(
                          "Motivo de la consulta",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        "Me he sentido triste sin razón",
                        style: TextStyle(
                            color: Colors.grey.shade800, fontSize: 13),
                      ),
                      const SizedBox(height: 20),
                      // Add a title widget
                      const Center(
                        child: Text(
                          "Antecedentes",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        "Que el paciente describa si alguien en su familia a padecido enfermedades mentales, etc",
                        style: TextStyle(
                            color: Colors.grey.shade800, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
