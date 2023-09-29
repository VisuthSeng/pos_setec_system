import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_setec_system/presentation/screen/customer_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: ElevatedButton(
        child: const Text('Get to Customer'),
        onPressed: () {
          Get.to(() => const CustomerScreen());
        },
      ),
    );
  }
}
