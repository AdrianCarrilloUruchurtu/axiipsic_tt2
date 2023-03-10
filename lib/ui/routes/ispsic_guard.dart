import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/services/user_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'router.gr.dart';

class CheckIfUserIsPsic extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final userRepo = getIt.get<UserRepo>();
    final User? currentUser = FirebaseAuth.instance.currentUser;
    final userData = await userRepo.get(currentUser!.uid);

    var isUser = FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .get();

    if (userData!.ispsic == "Psicologo") {
      resolver.next(true);
      print("Hola psicologo");
    } else if (userData.ispsic == "Paciente") {
      resolver.next(false);
      router.push(const PsicHomeRoute());
    } else {
      router.replace(const LoginRoute());
    }
  }
}
