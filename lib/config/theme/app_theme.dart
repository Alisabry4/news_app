import 'package:flutter/material.dart';
import 'package:news/config/theme/app_styles.dart';
import 'package:news/core/utils/colors_manager.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: ColorsManager.white),
          titleTextStyle: AppStyles.appBar,
          centerTitle: true,
          color: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
          )),
      drawerTheme: DrawerThemeData(backgroundColor: ColorsManager.white),
      scaffoldBackgroundColor: Colors.transparent);
}
