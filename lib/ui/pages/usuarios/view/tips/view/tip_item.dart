import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tips/view-model/tipsMobx.dart';
import 'package:flutter/material.dart';
import '../../../../../routes/router.gr.dart';
import '../../../../auth/model/user_data.dart';
import '../model/tips_model.dart';

class TipItem extends StatelessWidget {
  TipItem({super.key, required this.doc, this.onTap, required this.docUser});

  final Function()? onTap;
  final TipsData doc;
  final UserData? docUser;
  late final _tipMobx = TipsMobx(docUser!.email);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.blueAccent.shade100,
          borderRadius: BorderRadius.circular(16.0)),
      child: ListTile(
        onLongPress: () async {
          final delete = await showDialog<bool>(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("¿Eliminar Tip?"),
              content: const Text("¿Estás seguro que deseas eliminar el tip?"),
              actions: [
                TextButton(
                  onPressed: () => context.router.pop(),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                  child: const Text("No"),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                  child: const Text("Si"),
                ),
              ],
            ),
          );
          if (delete ?? false) {
            _tipMobx.deleteTip(doc.id);
          }
        },
        onTap: onTap,
        title: Text(
          doc.tipContent,
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        trailing: Visibility(
          visible: true, //Cambiar visibilidad según tipo de usuario
          child: IconButton(
            icon: const Icon(
              Icons.edit,
              size: 26,
            ),
            color: Colors.pink.shade50,
            onPressed: () {
              context.router.push(const TipEditRoute());
            },
          ),
        ),
      ),
    );
  }
}
