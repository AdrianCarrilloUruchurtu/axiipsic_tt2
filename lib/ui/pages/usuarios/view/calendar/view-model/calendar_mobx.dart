import 'package:axiipsic_tt2/services/calendar_repo.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/calendar/model/calendar_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'calendar_mobx.g.dart';

@injectable
class CalendarStore = _CalendarStoreBase with _$CalendarStore;

abstract class _CalendarStoreBase with Store {
  final _calendarRepo = GetIt.instance.get<CalendarRepo>();

  _CalendarStoreBase() {
    _calendarRepo.calendarChanges().listen((event) {
      eventList = event;
    });
  }

  @action
  crearEvento(Timestamp date, String title, String description) {
    _calendarRepo.addEvent(date, title, description);
  }

  @action
  leerEvento(DateTime focusedDay, Map<DateTime, List<CalendarData>> events) {
    _calendarRepo.loadEvent(focusedDay, events);
  }

  @observable
  List<CalendarData>? eventList;
}
