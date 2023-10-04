import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_setec_system/core/util/Uid.dart';
import 'package:pos_setec_system/data/model/customer_model.dart';
import 'package:pos_setec_system/presentation/controller/customer_controller.dart';
import 'package:pos_setec_system/presentation/screen/home/layout/button_save.dart';
import 'package:pos_setec_system/presentation/screen/home/layout/form_header.dart';
import 'package:pos_setec_system/presentation/widget/textbox.dart';

class CustomerForm extends StatefulWidget {
  final bool closeFormWhenSuccess;

  final void Function()? onSavedComplete;
  final bool formEdit;
  const CustomerForm({
    Key? key,
    this.closeFormWhenSuccess = false,
    this.onSavedComplete,
    this.formEdit = false,
  }) : super(key: key);

  @override
  State<CustomerForm> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  final CustomerController customerController = Get.find();

  late TextEditingController tecName;
  late TextEditingController tecAddress;
  late TextEditingController tecPhone;

  late FocusNode fnName;
  late FocusNode fnAddress;
  late FocusNode fnPhone;

  bool errorCategoryBlank = false;
  bool errorCategoryExist = false;

  bool loading = false;

  @override
  void initState() {
    tecName = TextEditingController();
    tecAddress = TextEditingController();
    tecPhone = TextEditingController();

    fnName = FocusNode();
    fnAddress = FocusNode();
    fnPhone = FocusNode();

    if (widget.formEdit == true) {
      tecName.text = customerController.selectedCustomer!.name;
      tecAddress.text = customerController.selectedCustomer!.address;
      tecPhone.text = customerController.selectedCustomer!.phone;
    }

    super.initState();
  }

  @override
  void dispose() {
    tecName.dispose();
    tecAddress.dispose();
    tecPhone.dispose();

    fnName.dispose();
    fnAddress.dispose();
    fnPhone.dispose();

    super.dispose();
  }

  Future<void> saveData() async {
    var model = CustomerModel(
      id: UId.getId(),
      name: tecName.text,
      address: tecAddress.text,
      phone: tecPhone.text,
    );
    customerController.saveData(model);
  }

  Future<void> updateData() async {
    var model = CustomerModel(
      id: customerController.selectedCustomer!.id,
      name: tecName.text,
      address: tecAddress.text,
      phone: tecPhone.text,
    );
    customerController.updateData(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FormHeader(
              title: 'Customer Form',
            ),
            TextBox(focusNode: fnName, controller: tecName, labelText: 'Name'),
            TextBox(
                focusNode: fnAddress,
                controller: tecAddress,
                labelText: 'Address'),
            TextBox(
                focusNode: fnPhone, controller: tecPhone, labelText: 'Phone'),
          ],
        ),
      ),
      floatingActionButton: ButtonSave(onPressed: () async {
        if (widget.formEdit == false) {
          // Use '==' for comparison
          await saveData();
        } else {
          await updateData();
        }

        Get.back();
      }),
    );
  }
}
