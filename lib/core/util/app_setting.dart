import 'package:flutter/material.dart';


import '../../core/constant/theme_code.dart';


class AppSetting {
  //supabase

  //client
  static String clientId = 'client-id';

  static bool isLoading = true;

  //theme
  static String themeCode = ThemeCode.light;

  //language



  //context
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static List<BuildContext?> listFormContext = [];


}
