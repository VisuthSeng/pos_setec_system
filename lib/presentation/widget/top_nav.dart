import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_setec_system/presentation/screen/customer/customer_screen.dart';
import 'package:pos_setec_system/presentation/screen/category/category_screen.dart';
import 'package:pos_setec_system/presentation/screen/setec/pos_system_setec_screen.dart';

import 'package:pos_setec_system/presentation/widget/custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      // leading: IconButton(
      //     onPressed: () {
      //       key.currentState!.openDrawer();
      //     },
      //     icon: const Icon(
      //       Icons.menu,
      //       color: Colors.red,
      //     )),
      // elevation: 0,
      title: Row(
        children: [
          const Visibility(
              child: CustomText(
            text: 'SETEC INSTITUTE',
            color: Colors.lightBlueAccent,
            size: 20,
            weight: FontWeight.bold,
          )),
          Expanded(child: Container()),
          IconButton(
            onPressed: () {
              Get.offAll(
                () => const CategoryScreen(),
              );
            },
            icon: const Icon(Icons.settings, color: Colors.green),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Get.offAll(() => const CustomerScreen());
                },
                icon: const Icon(Icons.notifications, color: Colors.blueGrey),
              ),
              Positioned(
                  top: 7,
                  right: 7,
                  child: Container(
                    width: 12,
                    height: 12,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3C19C0),
                      borderRadius: BorderRadius.circular(30),
                      border:
                          Border.all(color: const Color(0xFFF7F8FC), width: 2),
                    ),
                  ))
            ],
          ),
          Container(
            width: 1,
            height: 22,
            color: const Color(0xFFA4A6B3),
          ),
          const SizedBox(
            width: 24,
          ),
          const CustomText(
            text: 'Visuth Seng',
            size: null,
            color: Color(0xFFA4A6B3),
            weight: null,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundColor: const Color(0xFFF7F8FC),
                child: IconButton(
                  onPressed: () {
                    Get.to(() => const SETECScreen());
                  },
                  icon: const Icon(Icons.person_2_outlined),
                ),
              ),
            ),
          ),
        ],
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFF363740),
      ),
      backgroundColor: const Color(0xffFFFFFF),
    );
