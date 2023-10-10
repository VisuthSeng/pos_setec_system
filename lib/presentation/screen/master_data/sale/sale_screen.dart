import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_setec_system/core/util/Uid.dart';
import 'package:pos_setec_system/data/model/category_model.dart';
import 'package:pos_setec_system/data/model/product_model.dart';
import 'package:pos_setec_system/data/model/sale_detail_model.dart';
import 'package:pos_setec_system/presentation/controller/category_controller.dart';
import 'package:pos_setec_system/presentation/screen/master_data/sale/component/sale_header_item_tab.dart';
import 'package:pos_setec_system/presentation/widget/button_text.dart';
import 'component/sale_header.dart';
import 'package:pos_setec_system/presentation/screen/master_data/sale/component/sale_order_item.dart';

import '../../../controller/product_controller.dart';
import 'component/sale_item.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({super.key});

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  final ProductController productController = Get.find();
  final CategoryController categoryController = Get.find();

  late TextEditingController tecSearch;
  late FocusNode fnSearch;

  late CategoryModel? selectedCategory;
  late ProductModel? selectedProduct;
  List<ProductModel> listProduct = [];
  List<SaleDetailModel> listOrder = [];
  double totalPrice = 0.0;
  double tax = 0.0;
  double grandTotal = 0.0;

  @override
  void initState() {
    selectedCategory = null;
    categoryController.listOfCategory();
    listProduct.assignAll(productController.listOfProduct);
    tecSearch = TextEditingController();
    fnSearch = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    tecSearch.dispose();
    fnSearch.dispose();

    super.dispose();
  }

  void calculateToGrandTotal() {
    tax = totalPrice * 10 / 100;
    grandTotal = totalPrice + tax;
  }

  void addOrder(ProductModel model) {
    // Find an item with the same productName in the listOrder
    SaleDetailModel existingItem;
    try {
      existingItem = listOrder.firstWhere(
        (item) => item.productName == model.name,
      );
      // If the item exists, increment its quantity
      totalPrice += existingItem.price;
      calculateToGrandTotal();
      existingItem.qty += 1;
    } catch (e) {
      // If the item doesn't exist, add a new item to the listOrder
      var order = SaleDetailModel(
        id: UId.getId(),
        productName: model.name,
        qty: 1, // Initialize qty to 1 for a new item
        img: model.img,
        price: model.price,
        discount: 0,
        amount: 0,
      );
      totalPrice += order.price;
      calculateToGrandTotal();
      listOrder.add(order);
    }
  }

  void increaseOrder(SaleDetailModel model) {
    SaleDetailModel existingItem;
    try {
      existingItem = listOrder.firstWhere(
        (item) => item.productName == model.productName,
      );
      // If the item exists, increment its quantity
      if (existingItem.qty > 0) {
        existingItem.qty += 1;
        totalPrice += model.price;
        calculateToGrandTotal();
      }
    } catch (e) {
      // If the item doesn't exist, add a new item to the listOrder
    }
  }

  void removeOrder(SaleDetailModel model) {
    SaleDetailModel existingItem;
    try {
      existingItem = listOrder.firstWhere(
        (item) => item.productName == model.productName,
      );
      // If the item exists, increment its quantity
      if (existingItem.qty > 1) {
        totalPrice -= model.price;
        calculateToGrandTotal();
        existingItem.qty -= 1;
      } else {
        totalPrice -= model.price;
        calculateToGrandTotal();
        listOrder.remove(model);
      }
    } catch (e) {
      // If the item doesn't exist, add a new item to the listOrder
    }
  }

  void selectProduct(ProductModel? model) {
    selectedProduct = model;
  }

  void selectCategory(CategoryModel? model) {
    selectedCategory = model;
  }

  void loadProductsByCategory(CategoryModel model) {
    // Filter products based on the selected category
    selectedProduct = null;
    listProduct.clear();
    listProduct.assignAll(productController.listAllProduct.where(
      (product) => product.categoryModel == model,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return categoryController.listOfCategory.isEmpty
            ? const SizedBox.shrink()
            : Container(
                width: constraints.maxWidth,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 14,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SaleHeader(
                              title: 'SETEC MART',
                              subTitle: '10/09/2023',
                              widget: ButtonText(
                                  height: 40,
                                  title: 'All Product',
                                  tooltip: 'All Product',
                                  onPress: () {
                                    setState(() {
                                      listProduct.assignAll(
                                          productController.listOfProduct);
                                      selectedCategory = null;
                                    });
                                  }),
                            ),
                            Container(
                              height: 100,
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: categoryController.listOfCategory
                                    .asMap()
                                    .entries
                                    .map(
                                  (entry) {
                                    final model = entry.value;
                                    return SaleHeaderItemTab(
                                      ontap: () {
                                        setState(() {
                                          loadProductsByCategory(model);
                                          selectedCategory =
                                              model; // Update the selectedCategory based on the index
                                        });
                                      },
                                      icon: model.img,
                                      title: model.name,
                                      color: selectedCategory == model
                                          ? Colors.orangeAccent
                                          : const Color(0xff1f2029),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                            SizedBox(
                              height: constraints.maxHeight - 161,
                              child: GridView.count(
                                  crossAxisCount: 4,
                                  childAspectRatio:
                                      0.7, // Adjust this value as needed
                                  children: listProduct
                                      .map(
                                        (model) => SaleItem(
                                          image: model.img,
                                          title: 'Original Burger',
                                          price: model.price.toString(),
                                          item: '11 item',
                                          productModel: model,
                                          onPress: () {
                                            setState(() {
                                              addOrder(model);
                                            });
                                          },
                                        ),
                                      )
                                      .toList()),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SaleHeader(
                                title: 'Order',
                                subTitle: 'Table 8',
                                widget: Container()),
                            const SizedBox(height: 20),
                            Expanded(
                              child: ListView(
                                  children: listOrder
                                      .map(
                                        (model) => SaleOrderItem(
                                          image: model.img,
                                          title: model.productName,
                                          qty: model.qty.toString(),
                                          price: '\$ ${model.price}',
                                          remove: () {
                                            setState(() {
                                              removeOrder(model);
                                            });
                                          },
                                          add: () {
                                            setState(() {
                                              increaseOrder(model);
                                            });
                                          },
                                        ),
                                      )
                                      .toList()),
                            ),
                            if (listOrder.isNotEmpty)
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: const Color(0xff1f2029),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Subtotal',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            '\$ $totalPrice',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Tax',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            '\$ $tax',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        height: 2,
                                        width: double.infinity,
                                        color: Colors.white,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Grand Total',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            '\$ $grandTotal',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 30),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: Colors.deepOrange,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.print, size: 16),
                                            SizedBox(width: 6),
                                            Text('Print Bills')
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
