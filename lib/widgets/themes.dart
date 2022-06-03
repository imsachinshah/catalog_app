import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        canvasColor: creamColor,
        cardColor: Colors.white,
        textTheme: const TextTheme(
            titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 8, 35, 56))),
        buttonTheme: ButtonThemeData(buttonColor: blueColor),
        primarySwatch: Colors.deepPurple,
        primaryColor: blueColor,
        appBarTheme: const AppBarTheme(
            elevation: 0.0,
            color: Colors.white,
            titleTextStyle: TextStyle(color: Colors.black),
            iconTheme: IconThemeData(color: Colors.black)),
        fontFamily: GoogleFonts.poppins().fontFamily,
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        canvasColor: darkColor,
        cardColor: Colors.black,
        textTheme: const TextTheme(
            titleMedium:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        buttonTheme: ButtonThemeData(buttonColor: lightBlueColor),
        primarySwatch: Colors.grey,
        primaryColor: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
            elevation: 0.0,
            color: Colors.black,
            titleTextStyle: TextStyle(
              color: Colors.white,
            ),
            iconTheme: IconThemeData(color: Colors.white)),
      );


  // Colors

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkColor = Vx.gray900;
  static Color blueColor = const Color.fromARGB(255, 8, 35, 56);
  static Color? lightBlueColor = const Color.fromARGB(255, 44, 59, 141);
}
