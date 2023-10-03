import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pos_setec_system/presentation/screen/master_data/category/category_screen.dart';
import 'package:pos_setec_system/presentation/screen/master_data/customer/customer_screen.dart';
import 'package:pos_setec_system/presentation/screen/setec/pos_system_setec_screen.dart';
import 'package:pos_setec_system/presentation/screen/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      transitionDuration: const Duration(milliseconds: 200),
      defaultTransition: Transition.fade,
      debugShowCheckedModeBanner: false,
      title: 'SETEC POS SYSTEM',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.deepPurple,
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue),
      builder: (context, page) => HomeScreen(
        child: page!,
      ),
      initialRoute: '/', // Define the initial route
      getPages: [
        GetPage(
          name: '/',
          page: () => const SETECScreen(),
        ),
        GetPage(
          name: '/category',
          page: () => const CategoryScreen(),
        ),
        GetPage(
          name: '/customer',
          page: () => const CustomerScreen(),
        ),
      ],
    );
  }
}
