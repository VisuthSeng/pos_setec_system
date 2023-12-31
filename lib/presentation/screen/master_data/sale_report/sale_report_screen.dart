import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_setec_system/data/model/sale_model.dart';
import 'package:pos_setec_system/presentation/controller/sale_controller.dart';
import 'component/sale_report_list.dart';
import '../../../util/form_list_title.dart';

class SaleReportScreen extends StatefulWidget {
  const SaleReportScreen({super.key});

  @override
  State<SaleReportScreen> createState() => _SaleReportScreenState();
}

class _SaleReportScreenState extends State<SaleReportScreen> {
  final SaleController saleController = Get.find();

  late TextEditingController tecSearch;
  late FocusNode fnSearch;

  List<String> day = ['Last Week', 'Last month', 'Now'];
  @override
  void initState() {
    saleController.listOfSale.sort((a, b) => b.createAt.compareTo(a.createAt));
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

  void showLastWeekSales() {
    saleController.filterSalesForLastWeek();
  }

  void showLastMonthSales() {
    saleController.filterSalesForLastMonth();
  }

  void showFullSalesList() {
    saleController.resetAndSortSalesListHighToLow();
  }

  Future<void> onDeleteSaleReport(SaleModel sale) async {
    saleController.deleteData(sale.id);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        width: 1010,
        height: constraints.maxHeight,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FormListTitle(
                    title: 'Sale Report',
                    record: saleController.listOfSale.length,
                    fnSearch: fnSearch,
                    tecSearch: tecSearch,
                    onSearch: (search) {
                      saleController.searchData(search);
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
                                      'Invoice',
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
                                      'Customer Name',
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
                                      'Total',
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
                                    child: PopupMenuButton<int>(
                                      // Use int to represent the index
                                      offset: const Offset(0, 50),
                                      onSelected: (int selectedIndex) async {
                                        if (selectedIndex == 0) {
                                          showLastWeekSales();
                                        } else if (selectedIndex == 1) {
                                          showLastMonthSales();
                                        } else {
                                          showFullSalesList();
                                        }
                                        // Handle the selected date here using selectedDate
                                      },
                                      itemBuilder: (context) {
                                        return List.generate(day.length,
                                            (index) {
                                          return PopupMenuItem<int>(
                                            value:
                                                index, // Use the index as the value
                                            child: Text(day[index]),
                                          );
                                        });
                                      },
                                      child: SizedBox(
                                        width: 80,
                                        height: 40,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Date', // You can set the initial value here
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            const Icon(Icons.arrow_drop_down),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      'Time',
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
                            child: Obx(
                              () => Column(
                                children: List.generate(
                                  saleController.listOfSale.length,
                                  (index) => SaleReportList(
                                      saleModel:
                                          saleController.listOfSale[index],
                                      index: index,
                                      onSelect: () =>
                                          saleController.selectSaleReport(
                                            saleController.listOfSale[index],
                                          ),
                                      onEdit: () {
                                        saleController.selectSaleReport(
                                            saleController.listOfSale[index]);
                                        // Get.to(
                                        //   () => ProductForm(
                                        //     formEdit: true,
                                        //     onSavedComplete: () async {},
                                        //   ),
                                        // );
                                      },
                                      onDelete: () async {
                                        await onDeleteSaleReport(
                                          saleController.listOfSale[index],
                                        );
                                      }),
                                ),
                              ),
                            ),
                          ),
                        ),
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
