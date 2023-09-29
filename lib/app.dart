import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_setec_system/presentation/screen/customer_screen.dart';
import 'package:pos_setec_system/presentation/screen/home_screen.dart';

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
