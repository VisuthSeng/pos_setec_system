import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_setec_system/data/model/customer_model.dart';
import 'package:pos_setec_system/presentation/controller/customer_controller.dart';
import 'package:pos_setec_system/presentation/screen/master_data/customer/component/customer_list.dart';
import 'package:pos_setec_system/presentation/screen/master_data/customer/customer_form.dart';
import 'package:pos_setec_system/presentation/util/form_list_title.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  final CustomerController customerController = Get.find();

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

  void onDelete(CustomerModel model) {
    customerController.deleteData(model.id);
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
                      title: 'Customer',
                      record: customerController.listOfCustomer.length,
                      fnSearch: fnSearch,
                      tecSearch: tecSearch,
                      onSearch: (search) {
                        customerController.searchData(search);
                      },
                      onPress: () {
                        Get.to(() => const CustomerForm());
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
                                        'Name',
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
                                        'Phone',
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
                                        'Address',
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
                                  customerController.listOfCustomer.length,
                                  (index) => CustomerList(
                                    customerModel: customerController
                                        .listOfCustomer[index],
                                    index: index,
                                    onSelect: () =>
                                        customerController.selectCustomer(
                                      customerController.listOfCustomer[index],
                                    ),
                                    onEdit: () {
                                      customerController.selectCustomer(
                                          customerController
                                              .listOfCustomer[index]);
                                      Get.to(
                                        () => const CustomerForm(
                                          formEdit: true,
                                        ),
                                      );
                                    },
                                    onDelete: () => onDelete(
                                      customerController.listOfCustomer[index],
                                    ),
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
      ),
    );
  }
}
