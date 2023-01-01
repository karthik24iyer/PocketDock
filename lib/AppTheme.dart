import 'package:flutter/material.dart';

class AppTheme {

  //static const Color eventColor = Colors.grey;
  //static const Color miscColor = Colors.white;
  //static const Color themeColor = Colors.black38;

  void changeColor() {
    //miscColor = Colors.white;
  }

  get darkTheme => ThemeData(
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(color: Colors.white30),
    backgroundColor: Colors.black,
  );

  get lightTheme => ThemeData(
    backgroundColor: Colors.pink,
    iconTheme: const IconThemeData(color: Colors.black),
    primaryTextTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.black),
      button: TextStyle(color: Colors.black),

    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.black),
      button: TextStyle(color: Colors.black),
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(
            color: Colors.black
        )
    ),
    tabBarTheme: const TabBarTheme(
          labelColor: Colors.pink,
          labelStyle: TextStyle(color: Colors.pink), // color for text
          indicator: UnderlineTabIndicator( // color for indicator (underline)
         borderSide: BorderSide(color: Colors.pink)),
  ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Colors.black),
    ),

  );
}