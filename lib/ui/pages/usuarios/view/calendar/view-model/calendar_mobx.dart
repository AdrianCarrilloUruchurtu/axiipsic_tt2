import 'package:axiipsic_tt2/services/calendar_repo.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/calendar/model/calendar_model.dart';
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
  crearEvento(DateTime date, String title, String description, String time) {
    _calendarRepo.addEvent(date, title, description, time);
  }

  @action
  leerEvento() async {
    eventList = await _calendarRepo.loadEvent();
  }

  @action
  eliminarEvento(String id) async {
    return _calendarRepo.deleteEvent(id);
  }

  @observable
  List<CalendarData>? eventList;
}
