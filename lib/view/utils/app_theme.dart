import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/utils/colors_constant.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(textTheme: TextTheme(
    displayLarge: TextStyle(
      color: Colors.white,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w600,
      fontSize: 32,
    ),
    displayMedium: TextStyle(
      color: Colors.white,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: 24,
    ),
    displaySmall: TextStyle(
      color: ColorConstant.primary,
      fontFamily: 'Montserrat',
      fontSize: 18,
      
    ),
    headlineMedium: TextStyle(
      color: ColorConstant.primary,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
      headlineSmall: TextStyle(
      color: ColorConstant.primary,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
      bodyLarge: TextStyle(
      color: ColorConstant.primary,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: 12,
    ),


  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all<Size>(Size(328,48)),
      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
        color: ColorConstant.primary,
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w600,
        fontSize: 16
      )),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      )),
      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 255, 255)),
      
    ),
    
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: ColorConstant.primary,
    contentTextStyle: const TextStyle(
      color: Colors.white,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: 12,
    )
  ),

  );
}
