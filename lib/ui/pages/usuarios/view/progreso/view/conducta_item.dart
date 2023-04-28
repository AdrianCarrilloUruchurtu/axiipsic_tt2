import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/progreso/view-model/progresoMobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/model/sesiones_model.dart';
import 'package:flutter/material.dart';

import '../model/progreso_model.dart';

class ConductaItem extends StatefulWidget {
  const ConductaItem(
      {super.key,
      required this.conducta,
      required this.onTap,
      required this.docSes});
  final ProgresoData conducta;
  final Function() onTap;
  final SesionesData docSes;

  @override
  State<ConductaItem> createState() => _ConductaItemState();
}

class _ConductaItemState extends State<ConductaItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.conducta.conducta,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: widget.onTap,
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          _deleteDialog(widget.conducta.id);
        },
      ),
    );
  }

  _deleteDialog(String id) async {
    final progresoMobx = ProgresoStore(widget.docSes.id);
    final delete = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Eliminar Conducta"),
        content: const Text("¿Estás seguro que deseas eliminar la conducta?"),
        actions: [
          TextButton(
            onPressed: () => context.router.pop(),
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
            ),
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () {
              progresoMobx.deleteProgreso(id);
              context.router.pop();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text("Si"),
          ),
        ],
      ),
    );

    // Cambiar también
  }
}
