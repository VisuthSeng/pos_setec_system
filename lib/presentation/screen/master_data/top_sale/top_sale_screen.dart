import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_setec_system/data/model/product_top_sold.dart';
import 'package:pos_setec_system/presentation/controller/product_top_sold_controller.dart';
import 'package:pos_setec_system/presentation/screen/master_data/top_sale/component/top_sale_list.dart';

import '../../../util/form_list_title.dart';

class TopSaleScreen extends StatefulWidget {
  const TopSaleScreen({super.key});

  @override
  State<TopSaleScreen> createState() => _TopSaleScreenState();
}

class _TopSaleScreenState extends State<TopSaleScreen> {
  final ProductTopSoldController productTopSoldController = Get.find();
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

  Future<void> onDeleteSaleReport(ProductTopSoldModel sale) async {
    productTopSoldController.deleteData(sale.id);
  }

  @override
  Widget build(BuildContext context) {
    productTopSoldController.listOfProduct
        .sort((a, b) => b.qty.compareTo(a.qty));
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        width: 1010,
        height: constraints.maxHeight,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Obx(
            () => SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FormListTitle(
                      title: 'Top Product',
                      fnSearch: fnSearch,
                      tecSearch: tecSearch,
                      record: productTopSoldController.listOfProduct.length,
                      onSearch: (search) {
                        productTopSoldController.searchData(search);
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
                                  SizedBox(
                                    width: 150,
                                    child: Center(
                                      child: Text(
                                        'Create At',
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
                                  productTopSoldController.listOfProduct.length,
                                  (index) => SaleTopList(
                                      saleModel: productTopSoldController
                                          .listOfProduct[index],
                                      index: index,
                                      onSelect: () => productTopSoldController
                                              .selectProduct(
                                            productTopSoldController
                                                .listOfProduct[index],
                                          ),
                                      onEdit: () {
                                        productTopSoldController.selectProduct(
                                            productTopSoldController
                                                .listOfProduct[index]);
                                        // Get.to(
                                        //   () => ProductForm(
                                        //     formEdit: true,
                                        //     onSavedComplete: () async {},
                                        //   ),
                                        // );
                                      },
                                      onDelete: () async {
                                        await onDeleteSaleReport(
                                          productTopSoldController
                                              .listOfProduct[index],
                                        );
                                        setState(() {
                                          productTopSoldController.listOfProduct
                                              .sort((a, b) =>
                                                  b.qty.compareTo(a.qty));
                                        });
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
      ),
    );
  }
}
