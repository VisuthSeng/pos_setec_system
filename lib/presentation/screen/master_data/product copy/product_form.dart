import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_setec_system/core/util/Uid.dart';
import 'package:pos_setec_system/data/model/product_model.dart';
import 'package:pos_setec_system/presentation/controller/product_controller.dart';
import 'package:pos_setec_system/presentation/screen/home/layout/button_save.dart';
import 'package:pos_setec_system/presentation/screen/home/layout/form_header.dart';
import 'package:pos_setec_system/presentation/widget/textbox.dart';

class ProductForm extends StatefulWidget {
  final bool closeFormWhenSuccess;

  final void Function()? onSavedComplete;
  final bool formEdit;
  const ProductForm({
    Key? key,
    this.closeFormWhenSuccess = false,
    this.onSavedComplete,
    this.formEdit = false,
  }) : super(key: key);

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final ProductController productController = Get.find();

  late TextEditingController tecName;

  late TextEditingController tecPrice;

  late FocusNode fnName;
  late FocusNode fnPrice;

  bool loading = false;

  @override
  void initState() {
    tecName = TextEditingController();
    tecPrice = TextEditingController();

    fnName = FocusNode();
    fnPrice = FocusNode();

    if (widget.formEdit == true) {
      tecName.text = productController.selectedProduct!.name;
      tecPrice.text = productController.selectedProduct!.price.toString();
    }

    super.initState();
  }

  @override
  void dispose() {
    tecName.dispose();
    tecPrice.dispose();

    fnName.dispose();
    fnPrice.dispose();

    super.dispose();
  }

  Future<void> saveData() async {
    var model = ProductModel(
      id: UId.getId(),
      name: tecName.text,
      price: double.tryParse(tecPrice.text) ?? 0,
      qty: 0,
    );
    await productController.saveData(model);
  }

  Future<void> updateData() async {
    var model = ProductModel(
      id: productController.selectedProduct!.id,
      name: tecName.text,
      price: double.tryParse(tecPrice.text) ?? 0,
      qty: 0,
    );
    await productController.updateData(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FormHeader(
              title: 'Product Form',
            ),
            TextBox(focusNode: fnName, controller: tecName, labelText: 'Name'),
            TextBox(
                focusNode: fnPrice, controller: tecPrice, labelText: 'Price'),
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
