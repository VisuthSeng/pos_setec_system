import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pos_setec_system/app.dart';
import 'package:pos_setec_system/core/util/app_setting.dart';
import 'package:pos_setec_system/main_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

//load all dependency
  _injectDepencies();

  runApp(const MyApp());
}

void _injectDepencies() {
  AppSetting.isLoading = true;
  MainBinding().dependencies();
  AppSetting.isLoading = false;
}
