import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_setec_system/core/util/Uid.dart';
import 'package:pos_setec_system/data/model/customer_model.dart';
import 'package:pos_setec_system/presentation/controller/category_controller.dart';
import 'package:pos_setec_system/presentation/controller/customer_controller.dart';
import 'package:pos_setec_system/presentation/widget/numberbox.dart';
import 'package:pos_setec_system/presentation/widget/textbox.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  final CustomerController customerController = Get.find();
  final CategoryController categoryController = Get.find();

  late TextEditingController tecName;
  late TextEditingController tecPhone;
  late TextEditingController tecAddress;

  late FocusNode fnName;
  late FocusNode fnPhone;
  late FocusNode fnAddress;

  bool errorCustomerBlank = false;
  bool errorCustomerExist = false;
  bool errorMember = false;

  List<CustomerModel> listCustomer = [];

  @override
  void initState() {
    tecName = TextEditingController();
    tecPhone = TextEditingController();
    tecAddress = TextEditingController();

    fnName = FocusNode();
    fnPhone = FocusNode();
    fnAddress = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    tecName.dispose();
    tecPhone.dispose();
    tecAddress.dispose();

    fnName.dispose();
    fnPhone.dispose();
    fnAddress.dispose();

    super.dispose();
  }

  void saveData() async {
    var model = CustomerModel(
      id: UId.getId(), // You may want to generate a unique ID here.
      name: 'Visuth Seng',
      phone: '069 23 33 93',
      address: 'Phnom Penh',
    );
    listCustomer.add(model);
    customerController.saveData(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: const Text('Customer Screen'),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextBox(
                focusNode: fnName,
                controller: tecName,
                labelText: 'Customer Name',
              ),
              TextBox(
                focusNode: fnAddress,
                controller: tecAddress,
                labelText: 'Address',
              ),
              NumberBox(
                focusNode: fnPhone,
                controller: tecPhone,
                labelText: 'Phone',
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    saveData();
                  });
                },
                child: const Text('Save'),
              ),
              Column(
                children: customerController.listOfCustomer
                    .map(
                      (model) => Text(
                        model.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
