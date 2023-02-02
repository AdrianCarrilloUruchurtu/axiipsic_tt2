import 'package:axiipsic_tt2/ui/pages/home/patient_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageRouter extends StatelessWidget {
  const PageRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (BuildContext context){
            return  HomePage();
        },
      },
    );
  }
}
