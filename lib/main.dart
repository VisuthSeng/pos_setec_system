import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pos_setec_system/app.dart';
import 'package:pos_setec_system/core/util/app_setting.dart';
import 'package:pos_setec_system/main_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDvr_LmF6AKxQce_FvN8Y1IizbaPt--Oq0",
        appId: "1:38512560229:web:48c27749b6a7a393271e8c",
        messagingSenderId: "38512560229",
        projectId: "pos-setec-system-5c62f",
      ),
    );
  }
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
