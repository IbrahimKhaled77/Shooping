import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping/shered/constant/color/colors.dart';

var themeLigeth= ThemeData(
  inputDecorationTheme: InputDecorationTheme(

    iconColor: defaultColor,
    enabledBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: defaultColor,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: defaultColor,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: defaultColor,
      ),
    ),
    prefixIconColor: defaultColor,
    suffixIconColor: defaultColor,
    labelStyle: TextStyle(color:defaultColor,),

  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: defaultColor,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness:Brightness.dark ,

    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    actionsIconTheme: IconThemeData(
      color: defaultColor,
      size: 25.0,
    ),
   // centerTitle: true,
    titleTextStyle: TextStyle(
      color: defaultColor,
      fontSize: 30.0,
      fontWeight: FontWeight.w500,

    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 20.0,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
   // type:BottomNavigationBarType.fixed,
  ),
  primarySwatch:defaultColor,
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontSize: 20.0,
      color: Colors.black,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
    bodySmall: TextStyle(
      color: Colors.grey,
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
    ),
  ),
  fontFamily: 'Jannah',

);

var themeDark= ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    iconColor: defaultColor,
    enabledBorder:OutlineInputBorder(
      borderSide: BorderSide(
        color: defaultColor,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: defaultColor,
      ),
    ),
    prefixIconColor: defaultColor,
    labelStyle: TextStyle(color:defaultColor, ),

  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: defaultColor,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness:Brightness.dark ,

    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    actionsIconTheme: IconThemeData(
      color: defaultColor,
      size: 25.0,
    ),
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: defaultColor,
      fontSize: 30.0,
      fontWeight: FontWeight.w500,

    ),

  ),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 20.0,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    type:BottomNavigationBarType.fixed,
  ),
  primarySwatch:Colors.deepOrange,
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontSize: 20.0,
      color: Colors.black,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
    bodySmall: TextStyle(
      color: Colors.grey,
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
    ),
  ),
  fontFamily: 'Jannah',

);