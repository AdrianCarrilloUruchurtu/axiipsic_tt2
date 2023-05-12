import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class GlobalMethod {
  Future<void> authErrorHandle(String subtitle, BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(right: 6),
                    child: Icon(
                      Icons.dangerous,
                      size: 50,
                    )),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Ocurrió un error'),
                )
              ],
            ),
            content: Text(subtitle),
            actions: [
              TextButton(
                  onPressed: () => AutoRouter.of(context).pop(),
                  child: const Text("OK"))
            ],
          );
        });
  }
}
