import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../view-model/calendar_mobx.dart';

class AddEvent extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime? selectedDate;
  const AddEvent(
      {Key? key,
      required this.firstDate,
      required this.lastDate,
      this.selectedDate})
      : super(key: key);

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  late DateTime _selectedDate;
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _calendarMobx = getIt.get<CalendarStore>();
  late String _selectedTime;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Event")),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          InputDatePickerFormField(
            firstDate: widget.firstDate,
            lastDate: widget.lastDate,
            initialDate: _selectedDate,
            onDateSubmitted: (date) {
              setState(() {
                _selectedDate = date;
              });
            },
          ),
          TextField(
            controller: _titleController,
            maxLines: 1,
            decoration: const InputDecoration(labelText: 'Título'),
          ),
          TextField(
            controller: _descController,
            maxLines: 5,
            decoration: const InputDecoration(labelText: 'Descripción'),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(64, 4, 64, 4),
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  )),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lightBlue)),
              onPressed: () {
                _timeDialog();
              },
              child: const Text("Hora"),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                )),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.lightBlue)),
            onPressed: () {
              _addEvent();
            },
            child: const Text("Guardar evento"),
          ),
        ],
      ),
    );
  }

  Future<void> _timeDialog() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        cancelText: "Cancelar",
        helpText: "Hora");
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  void _addEvent() async {
    final title = _titleController.text;
    final description = _descController.text;
    final time = _selectedTime;
    if (title.isEmpty || description.isEmpty || time.isEmpty) {
      const SnackBar(
        content: Text('Todos los campos deben llenarse'),
      );
      return;
    }

    print(widget.firstDate);
    print(widget.lastDate);
    print(_selectedDate);
    _calendarMobx.crearEvento(_selectedDate, title, description, time);
    // Timestamp.fromDate(_selectedDate)
    if (mounted) {
      context.popRoute();
    }
  }
}
