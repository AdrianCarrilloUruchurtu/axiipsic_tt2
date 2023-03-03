import 'package:auto_route/auto_route.dart';

class CheckIfUserIsGuest extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    
  resolver.next(true);
  } 
}