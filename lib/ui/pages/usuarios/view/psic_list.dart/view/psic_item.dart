import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view_model/auth_mobx.dart';
import 'package:flutter/material.dart';

import '../../../../auth/model/user_data.dart';

class PsicItem extends StatelessWidget {
  PsicItem({super.key, required this.psic});
  final UserData? psic;
  final _authMobx = getIt.get<AuthMobx>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(
                  'Vincular con psicólogo',
                  style: TextStyle(fontSize: 24),
                ),
                content: Text(
                  '¿Deseas que ${psic?.nombre} sea tu psicólogo?',
                  style: const TextStyle(fontSize: 20),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text(
                      'No',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    onPressed: () {
                      context.router.pop(false);
                    },
                  ),
                  TextButton(
                    child: const Text(
                      'Si',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      _authMobx.linkPatToPsic(psic?.email);
                      context.router.pop(true);
                    },
                  ),
                ],
              );
            },
          ).then((value) {
            // Process the user's choice (true for Yes, false for No)
            if (value != null && value) {
              // User selected Yes
              // Perform the necessary actions for linking to a psychologist
              print('Linking to psychologist...');
            } else {
              // User selected No
              // Perform the necessary actions for not linking to a psychologist
              print('Not linking to psychologist.');
            }
          });
        },
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Add some spacing between the top of the card and the title
                          Container(height: 5),
                          // Add a title widget
                          Text(
                            "${psic!.nombre} ${psic!.apellido}",
                            style: TextStyle(
                                color: Colors.grey.shade800, fontSize: 20),
                          ),
                          // Add some spacing between the title and the subtitle
                          Container(height: 5),
                          // Add a subtitle widget
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                psic!.email,
                                style: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 13),
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              Text("Cédula profesional: ${psic?.psicCed}")
                            ],
                          ),
                          // Add some spacing between the subtitle and the text
                          Container(height: 10),
                          // Add a text widget to display some text
                          Text(
                            "Área de intervención: ${psic!.psicCampo}",
                            maxLines: 2,
                            style: TextStyle(color: Colors.grey.shade700),
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
      ),
    );
  }
}
