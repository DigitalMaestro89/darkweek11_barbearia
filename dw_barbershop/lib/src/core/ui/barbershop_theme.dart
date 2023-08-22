import 'package:dw_barbershop/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

sealed class BarbershopTheme {
  static const _defaultInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: ColorConstants.colorGrey));

  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(color: ColorConstants.colorBrown),
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: Colors.black,
        fontFamily: FontConstants.fontFamily
      )

    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(color: ColorConstants.colorGrey),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: ColorConstants.colorRed),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: ColorConstants.colorBrown,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )
      )
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: ColorConstants.colorBrown,
          width: 1
        ),
        foregroundColor: ColorConstants.colorBrown,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        )
      )
    ),
    fontFamily: FontConstants.fontFamily
  );
}
