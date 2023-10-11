import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_setec_system/data/model/customer_model.dart';
import 'package:pos_setec_system/presentation/controller/customer_controller.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_language.dart';
import '../../../core/constant/app_size.dart';

import '../screen/home/layout/form_bottom.dart';
import '../widget/button_text.dart';
import '../widget/textbox_search.dart';

class BrowseCustomer extends StatefulWidget {
  final void Function(CustomerModel model) onSelected;
  final bool? multiSelect;
  const BrowseCustomer({
    Key? key,
    required this.onSelected,
    this.multiSelect = false,
  }) : super(key: key);

  @override
  State<BrowseCustomer> createState() => _BrowseCustomerState();
}

class _BrowseCustomerState extends State<BrowseCustomer> {
  final CustomerController customerController = Get.find();

  CustomerModel? selectedCategory;
  // late FocusNode fnSearch;
  @override
  void initState() {
    // fnSearch = FocusNode();
    // fnSearch.requestFocus();

    super.initState();
  }

  @override
  void dispose() {
    // fnSearch.dispose();
    super.dispose();
  }

//select category to where color selected
  void selectCategory(CustomerModel? model) {
    selectedCategory = model;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        height: constraints.maxHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.formRadius),
            ),
            width: 600,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Customer',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 180,
                              child: TextboxSearch(
                                label: AppLanguage.search,
                                onChanged: (value) {
                                  customerController.searchData(value);
                                },
                              ),
                            ),
                            // const SizedBox(
                            //   width: 10,
                            // ),
                            // Tooltip(
                            //   message: 'Close',
                            //   child: IconButton(
                            //     onPressed: () {
                            //       Navigator.pop(context);
                            //     },
                            //     icon: Icon(
                            //       Icons.close_rounded,
                            //       size: 30,
                            //       color: Theme.of(context).primaryColor,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.tableHeader,
                            borderRadius: BorderRadius.circular(
                                AppSize.tableHeaderRadius),
                          ),
                          width: 600,
                          height: AppSize.tableHeader,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: SizedBox(
                                  width: 60,
                                  child: Text(
                                    '#',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontSize: 15, color: Colors.black),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 250,
                                child: Text(
                                  'Customer Name',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 15, color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: 160,
                                child: Text(
                                  'Phone Number',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 15, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(),
                          width: 600,
                          height: constraints.maxHeight -
                              AppSize.formBrowseHeader -
                              AppSize.formBottom -
                              AppSize.tableHeader -
                              30,
                          child: Obx(
                            () => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: ListView.builder(
                                itemCount:
                                    customerController.listOfCustomer.length,
                                itemBuilder: ((context, index) =>
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectCategory(customerController
                                              .listOfCustomer[index]);
                                        });
                                        if (widget.multiSelect == false) {
                                          widget.onSelected(customerController
                                              .listOfCustomer[index]);
                                          Navigator.pop(context);
                                        } else {
                                          widget.onSelected(customerController
                                              .listOfCustomer[index]);
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: selectedCategory ==
                                                  customerController
                                                      .listOfCustomer[index]
                                              ? Colors.blue.withOpacity(0.2)
                                              : Colors.transparent,
                                          border: const Border(
                                            bottom: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 240, 240, 240)),
                                          ),
                                        ),
                                        height: 40,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 25),
                                              child: SizedBox(
                                                width: 60,
                                                child: Text(
                                                  '${index + 1}',
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          fontSize: 14,
                                                          color: Colors.black),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 250,
                                              child: Text(
                                                customerController
                                                    .listOfCustomer[index].name,
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 160,
                                              child: Text(
                                                customerController
                                                    .listOfCustomer[index]
                                                    .phone,
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FormBottom(
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ButtonText(
                            title: AppLanguage.quit,
                            tooltip: AppLanguage.quit,
                            onPress: () {
                              Navigator.pop(context);
                            },
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
