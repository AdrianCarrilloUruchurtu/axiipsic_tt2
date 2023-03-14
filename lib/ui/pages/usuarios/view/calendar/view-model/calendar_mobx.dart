import 'package:axiipsic_tt2/services/calendar_repo.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/calendar/model/calendar_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'calendar_mobx.g.dart';

class CalendarStore = _CalendarStoreBase with _$CalendarStore;

abstract class _CalendarStoreBase with Store {
  final _calendarRepo = GetIt.instance.get<CalendarRepo>();

  _CalendarStoreBase() {
    FirebaseAuth.instance.authStateChanges().listen((event) async {
      if (event != null) {
        calendar = (await _calendarRepo.get(event.uid));
      } else {
        calendar = null;
      }
    });
  }

  @observable
  CalendarData? calendar;
}
