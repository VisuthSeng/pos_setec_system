import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_setec_system/data/model/category_model.dart';
import '../../../../data/model/product_model.dart';
import '../../../controller/category_controller.dart';
import '../../../controller/product_controller.dart';
import 'component/product_list.dart';
import 'product_form.dart';
import '../../../util/form_list_title.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductController productController = Get.find();
  final CategoryController categoryController = Get.find();

  late TextEditingController tecSearch;
  late FocusNode fnSearch;
  @override
  void initState() {
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

  Future<void> onDeleteProduct(
      ProductModel product, CategoryModel category) async {
    // Step 1: Remove the product from the category's list of products
    // category.listProduct.removeWhere((p) => p.id == product.id);

    // // Step 2: Update the category with the modified list of products
    // await categoryController.updateData(category);

    productController.deleteData(product.id);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        width: 1010,
        height: constraints.maxHeight,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Obx(
            () => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  FormListTitle(
                    title: 'Product',
                    record: productController.listOfProduct.length,
                    fnSearch: fnSearch,
                    tecSearch: tecSearch,
                    onSearch: (search) {
                      productController.searchData(search);
                    },
                    onPress: () {
                      Get.to(() => const ProductForm());
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade400,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: constraints.maxWidth - 10,
                    height: constraints.maxHeight - 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 223, 226, 228),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                  child: Text(
                                    '#',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Center(
                                    child: Text(
                                      'Product',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Center(
                                    child: Text(
                                      'Category',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      'Price',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: constraints.maxWidth - 10,
                          height: constraints.maxHeight - 60 - 42,
                          child: SingleChildScrollView(
                            child: Column(
                              children: List.generate(
                                productController.listOfProduct.length,
                                (index) => ProductList(
                                    productModel:
                                        productController.listOfProduct[index],
                                    index: index,
                                    onSelect: () =>
                                        productController.selectProduct(
                                          productController
                                              .listOfProduct[index],
                                        ),
                                    onEdit: () {
                                      productController.selectProduct(
                                          productController
                                              .listOfProduct[index]);
                                      Get.to(
                                        () => ProductForm(
                                          formEdit: true,
                                          onSavedComplete: () async {},
                                        ),
                                      );
                                    },
                                    onDelete: () async {
                                      await onDeleteProduct(
                                          productController
                                              .listOfProduct[index],
                                          productController.listOfProduct[index]
                                              .categoryModel);
                                    }),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
