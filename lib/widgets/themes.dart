import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    // primaryTextTheme: GoogleFonts.latoTextTheme(),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: Theme.of(context).textTheme
    ),
    accentColor: darkBluishColor,
    canvasColor: creamColor,
    cardColor: Colors.white,
    buttonColor: darkBluishColor,
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      color: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: Theme.of(context).textTheme
    ),
    accentColor: Colors.white,
    canvasColor: darkCreamColor,
    cardColor: Colors.black,
    buttonColor: lightBluishColor,
    brightness: Brightness.dark
  );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Colors.grey[900];
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Colors.indigo[500];

}