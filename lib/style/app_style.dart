import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static List<Color> cardsColor = [
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
  ];
  static List<Color> iconColors = [
    Colors.white,
    Colors.red.shade200,
    Colors.pink.shade200,
    Colors.orange.shade300,
    Colors.purple.shade300,
    Colors.green.shade300,
    Colors.blue.shade300,
    Colors.blueGrey.shade300,
  ];
  static List<Color> conductaColors = [
    Colors.red.shade200,
    Colors.pink.shade200,
    Colors.orange.shade300,
    Colors.orangeAccent.shade400,
    Colors.yellow.shade300,
    Colors.greenAccent.shade400,
    Colors.blueAccent.shade400,
    Colors.purpleAccent.shade400,
    Colors.purple.shade300,
    Colors.green.shade300,
    Colors.blue.shade300,
    Colors.blueGrey.shade300,
  ];

  static TextStyle mainTitle = GoogleFonts.roboto(
      fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black);
  static TextStyle mainContent =
      GoogleFonts.nunito(fontSize: 20.0, fontWeight: FontWeight.normal);
  static TextStyle dateTitle =
      GoogleFonts.nunito(fontSize: 16.0, fontWeight: FontWeight.w400);
}
