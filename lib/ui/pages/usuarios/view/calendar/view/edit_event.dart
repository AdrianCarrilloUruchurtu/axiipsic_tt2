import 'package:axiipsic_tt2/ui/pages/usuarios/view/calendar/model/calendar_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditEvent extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final CalendarData event;
  const EditEvent(
      {Key? key,
      required this.firstDate,
      required this.lastDate,
      required this.event})
      : super(key: key);

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  late DateTime _selectedDate;
  late TextEditingController _titleController;
  late TextEditingController _descController;
  late String _selectedTime;

  //¿Esto esta bien? debería hacerlo con getit?
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDate = widget.event.date;
    _titleController = TextEditingController(text: widget.event.title);
    _descController = TextEditingController(text: widget.event.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editar evento")),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          InputDatePickerFormField(
            fieldHintText: "Fecha",
            fieldLabelText: "Fecha",
            firstDate: widget.firstDate,
            lastDate: widget.lastDate,
            initialDate: _selectedDate,
            onDateSubmitted: (date) {
              // ¿Reemplazar por getit?
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
              child: Text(widget.event.time),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                _addEvent();
              },
              child: const Text("Agregar evento"))
        ],
      ),
    );
  }

  void _addEvent() async {
    final title = _titleController.text;
    final description = _descController.text;

    if (title.isEmpty) {
      print('El título no puede estar vacío');
      return;
    }
    // Implementar mobx/crear método allá?
    await FirebaseFirestore.instance
        .collection('events')
        .doc(widget.event.id)
        .update({
      "title": title,
      "description": description,
      "date": Timestamp.fromDate(_selectedDate),
    });
    if (mounted) {
      // Navigator pop
    }
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
}
