import 'package:axiipsic_tt2/ui/pages/usuarios/view/calendar/model/calendar_model.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  final CalendarData event;
  final Function() onDelete;
  final Function()? onTap;

  const EventItem({
    Key? key,
    required this.event,
    required this.onDelete,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(event.title),
      subtitle: Text(event.date.toString()),
      onTap: onTap,
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDelete, //onPressed: onDelete pero no sé porqué no funciona :c
      ),
    );
  }
}
