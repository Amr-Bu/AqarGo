import 'package:flutter/material.dart';
import 'package:manzel/core/constant/color.dart';


//light theme

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    focusColor: mainColor1,
   iconTheme: IconThemeData(
     color: blackColor,
   ),

     cardColor:cardColor,
    appBarTheme:   AppBarTheme(
actionsPadding: EdgeInsets.all(5),
      backgroundColor: backgroundColor,
      surfaceTintColor: backgroundColor,
      elevation: 0,
      titleTextStyle: TextStyle(color: blackColor,fontSize: 25),
      actionsIconTheme: IconThemeData(color: blackColor),
      iconTheme: IconThemeData(color: blackColor),

    ),
    //
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontWeight: FontWeight.bold, color: blackColor, fontSize: 35),

        titleMedium: TextStyle(
            fontWeight: FontWeight.bold, color:blackColor, fontSize: 32),
        //
        titleSmall:TextStyle(
          color: blackColor, fontSize: 20,fontWeight: FontWeight.bold,),
        bodyLarge:TextStyle(
          color: blackColor, fontSize: 20,),
        bodySmall: TextStyle(
          color: blackColor, fontSize: 12,),
        bodyMedium: TextStyle(
          color: blackColor, fontSize: 16,),
        labelSmall: TextStyle(color: Colors.grey,fontSize: 12)
    ),

    scaffoldBackgroundColor:backgroundColor,


    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedItemColor: mainColor2,
      elevation: 20,
      backgroundColor:whitColor,
    )


);
//dark
ThemeData darkTheme = ThemeData(
    fontFamily: "Alarmi",
    dialogBackgroundColor:  Colors.black,

    brightness: Brightness.dark,
    cardColor: Colors.grey[200]?.withAlpha(20),
    appBarTheme:  const AppBarTheme(
      color: Colors.black54,
      elevation: 0,
      titleTextStyle: TextStyle(color:Colors.white,fontSize: 25),
      actionsIconTheme: IconThemeData(color: Colors.white),
      iconTheme: IconThemeData(color:Colors.white),

    ),

    textTheme: TextTheme(
        titleLarge: TextStyle(
            fontWeight: FontWeight.bold, color: whitColor, fontSize: 35),

        titleMedium: TextStyle(
            fontWeight: FontWeight.bold, color:whitColor, fontSize: 32),
        //
        titleSmall:TextStyle(
          color: whitColor, fontSize: 20,fontWeight: FontWeight.bold,),
        bodyLarge:TextStyle(
          color: whitColor, fontSize: 20,),
        bodySmall: TextStyle(
          color: whitColor, fontSize: 12,),
        bodyMedium: TextStyle(
          color: whitColor, fontSize: 16,),
        labelSmall: TextStyle(color: Colors.grey,fontSize: 12)
    ),
    scaffoldBackgroundColor: Colors.black54,
    //primarySwatch: defaultMatrialeColor,


    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: mainColor2,
        elevation: 20,
        backgroundColor: Colors.black54
    )


);

