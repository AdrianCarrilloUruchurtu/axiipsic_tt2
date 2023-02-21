import 'package:flutter/material.dart';
class GlobalMethod{
  Future<void> authErrorHandle( String subtitle, BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Image.network(
                      'https://image.flaticon.com/icons/png/128/564/564619.png',
                      height: 20,
                      width: 20,
                    )),
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Ocurrió un error'),
                )
              ],
            ),
            content: Text(subtitle),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: const Text("OK"))
            ],
          );
        });
  }
}
