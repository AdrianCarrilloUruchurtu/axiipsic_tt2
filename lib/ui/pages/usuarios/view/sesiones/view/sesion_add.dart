import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/view-model/sesiones_mobx.dart';
import 'package:flutter/material.dart';

import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:intl/intl.dart';
import '../../../../auth/model/user_data.dart';
import '../../calendar/view-model/calendar_mobx.dart';

class SesionesAdd extends StatefulWidget {
  const SesionesAdd({super.key, required this.doc});

  final UserData? doc;

  @override
  State<SesionesAdd> createState() => _SesionesAddState();
}

class _SesionesAddState extends State<SesionesAdd> {
  String id = "uno";
  late String _selectedTime;
  late DateTime _eventDate;
  late final _sesionesMobx = SesionesStore(widget.doc!.email);
  final _calendarMobx = getIt.get<CalendarStore>();

  final TextEditingController _dateInput = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: SizedBox(
                  width: 300,
                  height: 300,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: _titleController,
                          maxLines: 1,
                          decoration: const InputDecoration(
                              labelText: 'Título de la sesión',
                              icon: Icon(Icons.title)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: _descriptionController,
                          maxLines: 1,
                          decoration: const InputDecoration(
                              labelText: 'Descripción',
                              icon: Icon(Icons.description)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                        child: TextField(
                          onTap: _timeDialog,
                          textAlign: TextAlign.center,
                          controller: _timeController,
                          maxLines: 1,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.punch_clock),
                              hintText: "Horario de la sesión"),
                          readOnly: true,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: _dateInput,
                          maxLines: 1,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.calendar_today),
                              hintText: "Día de la sesión"),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(
                                    2000), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101));

                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('dd-MM-yyy').format(pickedDate);
                              setState(() {
                                _eventDate = pickedDate;
                                _dateInput.text = formattedDate;
                              });
                            } else {
                              const SnackBar(
                                content: Text("La fecha no fue seleccionada"),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          _sesionesMobx.crearSesion(
              [widget.doc!.email, widget.doc!.psicMail],
              _titleController.text,
              _descriptionController.text,
              _dateInput.text,
              widget.doc!.id,
              _selectedTime);
          _calendarMobx.crearEvento(_eventDate, _titleController.text,
              _descriptionController.text, _selectedTime);
          context.router.pop();
        }),
        child: const Icon(Icons.save),
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

// Appbar
  AppBar _appbar() {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return Container(
              margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  context.router.pop();
                },
              ));
        },
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
//❤️