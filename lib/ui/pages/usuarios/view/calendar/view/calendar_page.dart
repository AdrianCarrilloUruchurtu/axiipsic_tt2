import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/calendar/model/calendar_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:axiipsic_tt2/lib/get_it.dart';
import '../view-model/calendar_mobx.dart';
import 'add_event.dart';
import 'edit_event.dart';
import 'event_item.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _focusedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;
  late DateTime _selectedDay;
  late CalendarFormat _calendarFormat;
  final _calendarMobx = getIt.get<CalendarStore>();

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

// no va?
  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _firstDay = DateTime.now().subtract(const Duration(days: 1000));
    _lastDay = DateTime.now().add(const Duration(days: 1000));
    _selectedDay = DateTime.now();
    _calendarFormat = CalendarFormat.month;
    //
  }

  // Imagino que la implementación de cargar eventos ahora es con mobx

  List<CalendarData> _getEventsForTheDay(DateTime day) {
    return _calendarMobx.eventList
            ?.where((element) =>
                day.day == element.date.day &&
                day.month == element.date.month &&
                day.year == element.date.year)
            .toList() ??
        [];
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        appBar: _appBar(),
        body: ListView(
          children: [
            TableCalendar(
              eventLoader: _getEventsForTheDay,
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              focusedDay: _focusedDay,
              firstDay: _firstDay,
              lastDay: _lastDay,
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
                _calendarMobx.leerEvento();
                // _loadFirestoreEvents();
              },
              selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: const CalendarStyle(
                weekendTextStyle: TextStyle(
                  color: Colors.blue,
                ),
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.lightBlue,
                ),
              ),
              calendarBuilders: CalendarBuilders(
                headerTitleBuilder: (context, day) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(day.toString()),
                  );
                },
              ),
            ),
            ..._getEventsForTheDay(_selectedDay).map(
              (event) => EventItem(
                  event: event,
                  onTap: () async {
                    final res = await Navigator.push<bool>(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditEvent(
                            firstDate: _firstDay,
                            lastDate: _lastDay,
                            event: event),
                      ),
                    );

                    if (res ?? false) {
                      _calendarMobx.leerEvento();
                    }
                  },
                  onDelete: () async {
                    final delete = await showDialog<bool>(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("Delete Event?"),
                        content: const Text("Are you sure you want to delete?"),
                        actions: [
                          TextButton(
                            onPressed: () => context.popRoute(),
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
                            child: const Text("Yes"),
                          ),
                        ],
                      ),
                    );
                    // Cambiar también
                    // if (delete ?? false) {
                    //   await FirebaseFirestore.instance
                    //       .collection('events')
                    //       .doc(event.id)
                    //       .delete();
                    //   _loadFirestoreEvents();
                    // }
                  }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push<bool>(
              context,
              MaterialPageRoute(
                builder: (_) => AddEvent(
                  firstDate: _firstDay,
                  lastDate: _lastDay,
                  selectedDate: _selectedDay,
                ),
              ),
            );
            // Cambiar
            if (result ?? false) {
              _calendarMobx.leerEvento();
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  AppBar _appBar() {
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
