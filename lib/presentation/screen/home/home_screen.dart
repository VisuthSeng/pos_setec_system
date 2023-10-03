import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/category_controller.dart';
import '../../controller/customer_controller.dart';
import '../../controller/product_controller.dart';
import '../master_data/category/category_screen.dart';
import '../master_data/customer/customer_screen.dart';

import 'component/left_menu_item.dart';
import '../master_data/product/product_screen.dart';
import '../master_data/stock/stock_screen.dart';
import '../../util/responsive.dart';
import '../../widget/top_nav.dart';

class HomeScreen extends StatefulWidget {
  final Widget child;

  const HomeScreen({Key? key, required this.child}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final CategoryController categoryController = Get.find();

  final CustomerController customerController = Get.find();

  final ProductController productController = Get.find();

  List<String> listMasterData = [
    'Category',
    'Product',
    'Stock',
    'Customer',
  ];

  int selectedItem = -1;

  void deselectController() {
    productController.selectedProduct = null;
    categoryController.selectedCategory = null;
    customerController.selectedCustomer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet: Scaffold(
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
                  children: List.generate(listMasterData.length, (index) {
                    final String title = listMasterData[index];
                    IconData? icon;
                    Color? iconColor;

                    // Determine the icon and icon color based on the title (customize as needed)
                    if (title == 'Category') {
                      icon = Icons.category;
                      iconColor = Colors.amber;
                    } else if (title == 'Product') {
                      icon = Icons.shopping_cart;
                      iconColor = Colors.lightGreen;
                    } else if (title == 'Stock') {
                      icon = Icons.inventory_2_outlined;
                      iconColor = Colors.brown;
                    } else if (title == 'Customer') {
                      icon = Icons.people_alt_outlined;
                      iconColor = Theme.of(context).primaryColor;
                    }

                    return LeftMenuItem(
                      title: title,
                      icon: icon,
                      iconColor: iconColor,
                      bgColor: selectedItem == index
                          ? Colors.blue.withOpacity(0.2)
                          : const Color(0xffFFFFFF),
                      onSelected: () {
                        setState(() {
                          selectedItem = index;
                        });
                        deselectController();
                        if (title == 'Category') {
                          Get.offAll(() => const CategoryScreen());
                        } else if (title == 'Product') {
                          Get.offAll(() => const ProductScreen());
                        } else if (title == 'Stock') {
                          Get.offAll(() => const StockScreen());
                        } else if (title == 'Customer') {
                          Get.offAll(() => const CustomerScreen());
                        }
                      },
                    );
                  }),
                ),
              ),
            ),
            Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5),
                  child: widget.child,
                )),
          ],
        ),
      ),
    );
  }
}
