import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_setec_system/presentation/screen/category/category_screen.dart';
import 'package:pos_setec_system/presentation/screen/customer/customer_screen.dart';
import 'package:pos_setec_system/presentation/screen/home/component/left_menu_item.dart';
import 'package:pos_setec_system/presentation/widget/top_nav.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final Widget child;

  HomeScreen({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: topNavigationBar(
          context, scaffoldKey), // Make sure this function returns an AppBar
      backgroundColor: const Color(0xffE6EFFD),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              constraints: const BoxConstraints.expand(),
              color: const Color(0xffE6EFFD),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LeftMenuItem(
                    title: 'Category',
                    icon: Icons.category,
                    iconColor: Colors.amber,
                    onSelected: () {
                      Get.offAll(() => const CategoryScreen());
                    },
                  ),
                  LeftMenuItem(
                    title: 'Product',
                    icon: Icons.shopping_cart,
                    iconColor: Colors.lightGreen,
                    onSelected: () {
                      Get.offAll(() => const CustomerScreen());
                    },
                  ),
                  LeftMenuItem(
                    title: 'Stock',
                    icon: Icons.inventory_2_outlined,
                    iconColor: Colors.brown[200],
                    onSelected: () {
                      Get.offAll(() => const CustomerScreen());
                    },
                  ),
                  LeftMenuItem(
                    title: 'Customer',
                    icon: Icons.people_alt_outlined,
                    iconColor: Theme.of(context).primaryColor,
                    onSelected: () {
                      Get.offAll(() => const CustomerScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 5),
                child: child,
              )),
        ],
      ),
    );
  }
}
