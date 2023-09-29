import 'package:flutter/material.dart';

class AppLocalization {
  AppLocalization(this.locale);

  final Locale locale;
  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization)!;
  }

  late Map<String, String> _localizedValues;

  static final listOfLocale = [
    const Locale('en', 'US'),
    const Locale('km', 'KH'),
  ];

  String translate(String key) {
    return _localizedValues[key] ?? key;
  }
}
