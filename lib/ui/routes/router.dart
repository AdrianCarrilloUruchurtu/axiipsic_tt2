import 'package:auto_route/annotations.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view/login_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/notas/view/sesiones_notas.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/paciente/home/patient_home_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/paciente/linea/view/ayuda_linea.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/progreso/view/lector_conducta.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/progreso/view/progress_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/psicologo/home/psic_home_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/psicologo/lista/view/list_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/psicologo/user_funciones/view/funcs_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/view/lector_sesion.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/view/sesion_add.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/view/sesiones_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tareas/view/tarea_edit_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tareas/view/tarea_lector_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tareas/view/tareas_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tips/view/tip_edit.dart';
import 'package:axiipsic_tt2/ui/routes/ispat_guard.dart';
import 'package:axiipsic_tt2/ui/routes/ispsic_guard.dart';
import '../pages/auth/view/register_page.dart';
import '../pages/usuarios/view/calendar/view/calendar_page.dart';
import '../pages/usuarios/view/notas/view/editor_nota.dart';
import '../pages/usuarios/view/notas/view/lector_notas.dart';
import '../pages/usuarios/view/notas/view/main_notas.dart';
import '../pages/usuarios/view/tareas/view/tarea_add_page.dart';
import '../pages/usuarios/view/tips/view/add_tips.dart';
import '../pages/usuarios/view/tips/view/tips_page.dart';
import '../pages/usuarios/view/widget/profile_page.dart';
import 'guest_guard.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <MaterialRoute>[
    MaterialRoute(page: LoginPage, initial: true, guards: [CheckIfUserIsGuest]),
    MaterialRoute(page: RegisterPage),
    MaterialRoute(
      page: PsicHomePage,
      guards: [
        CheckIfUserIsPsic,
      ],
    ),
    MaterialRoute(page: PatHomePage, initial: true, guards: [
      CheckIfUserIsPat,
    ]),
    MaterialRoute(page: ListPage),
    MaterialRoute(page: ProgressPage),
    MaterialRoute(page: AyudaPage),
    MaterialRoute(page: ProfilePage),
    MaterialRoute(page: NotesPage), // MainPage
    MaterialRoute(page: CalendarPage), // MainPage
    MaterialRoute(page: NotaEditPage), // MainPage
    MaterialRoute(page: LectorPage), // MainPage
    MaterialRoute(page: FuncsPage), // MainPage
    MaterialRoute(page: TipsPage), // MainPage
    MaterialRoute(page: AddTipPage), // MainPage
    MaterialRoute(page: TareasPage),
    MaterialRoute(page: TareaAddPage), // MainPage
    MaterialRoute(page: SesionesPage), // MainPage
    MaterialRoute(page: SesionesAdd), // MainPage
    MaterialRoute(page: TareaLectorPage), // MainPage
    MaterialRoute(page: TareaEditPage), // MainPage
    MaterialRoute(page: TipEditPage), // MainPage
    MaterialRoute(page: LectorSesPage), // MainPage
    MaterialRoute(page: NotasSesionesPage), // MainPage
    MaterialRoute(page: ConductaLectorPage), // MainPage
    // MainPage
  ],
)
class $AppRouter {}
