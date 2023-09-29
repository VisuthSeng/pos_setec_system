import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_setec_system/main_binding.dart';
import 'package:pos_setec_system/presentation/screen/customer_screen.dart';
import 'package:pos_setec_system/presentation/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

//load all dependency
  _injectDepencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Define the initial route
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/customer', page: () => const CustomerScreen()),
      ],
    );
  }
}

void _injectDepencies() {
  MainBinding().dependencies();
}
