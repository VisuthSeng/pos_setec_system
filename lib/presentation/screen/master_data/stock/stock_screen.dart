import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/product_model.dart';
import '../../../controller/product_controller.dart';
import '../../../util/form_list_title.dart';
import 'component/stock_list.dart';
import 'stock_form.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({super.key});

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  final ProductController productController = Get.find();

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

  void onDelete(ProductModel model) {
    productController.deleteData(model.id);
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
                    title: 'Stock',
                    record: productController.listOfProduct.length,
                    fnSearch: fnSearch,
                    tecSearch: tecSearch,
                    onSearch: (search) {
                      productController.searchData(search);
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
                                      'Qty',
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
                                (index) => StockList(
                                  productModel:
                                      productController.listOfProduct[index],
                                  index: index,
                                  onSelect: () =>
                                      productController.selectProduct(
                                    productController.listOfProduct[index],
                                  ),
                                  onEdit: () {
                                    productController.selectProduct(
                                        productController.listOfProduct[index]);
                                    Get.to(
                                      () => const StockForm(
                                        formEdit: true,
                                      ),
                                    );
                                  },
                                ),
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
