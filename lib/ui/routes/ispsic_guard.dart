import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'router.gr.dart';

class CheckIfUserIsPsic extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    
    final User? currentUser = FirebaseAuth.instance.currentUser;
    
    var isUser = FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).get().
    then((DocumentSnapshot snapshot) {

      if(snapshot.exists){
        if (snapshot.get('ispsic') == "Psicologo") {
          
      router.push(const PsicHomeRoute());
        } else {
          
      router.push(const PatHomeRoute());
        }}
       else {
      router.push(const LoginRoute());
      }
      }
    ); 
  }

}