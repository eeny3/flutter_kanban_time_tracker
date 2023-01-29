import 'package:flutter/material.dart';
import 'package:kanban_flutter/resources/styles.dart';

abstract class Themes {
  static final ThemeData defaultTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,

    appBarTheme: AppBarTheme(
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: Palette.grey,
      iconTheme: const IconThemeData(color: Palette.white),
      titleTextStyle: TextStyles.textSize18Weight500,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Palette.blue,
      unselectedItemColor: Palette.white,
      backgroundColor: Palette.black,
    ),
  );
}
