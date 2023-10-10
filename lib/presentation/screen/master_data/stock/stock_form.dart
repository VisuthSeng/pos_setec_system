import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/model/product_model.dart';
import '../../../controller/product_controller.dart';
import '../../home/layout/button_save.dart';
import '../../home/layout/form_header.dart';
import '../../../widget/textbox.dart';

class StockForm extends StatefulWidget {
  final bool closeFormWhenSuccess;

  final void Function()? onSavedComplete;
  final bool formEdit;
  const StockForm({
    Key? key,
    this.closeFormWhenSuccess = false,
    this.onSavedComplete,
    this.formEdit = false,
  }) : super(key: key);

  @override
  State<StockForm> createState() => _StockFormState();
}

class _StockFormState extends State<StockForm> {
  final ProductController productController = Get.find();

  late TextEditingController tecQty;

  late FocusNode fnQty;

  bool loading = false;

  @override
  void initState() {
    tecQty = TextEditingController();

    fnQty = FocusNode();

    if (widget.formEdit == true) {
      tecQty.text = productController.selectedProduct!.qty.toString();
    }

    super.initState();
  }

  @override
  void dispose() {
    tecQty.dispose();

    fnQty.dispose();

    super.dispose();
  }

  Future<void> updateData() async {
    var model = ProductModel(
      id: productController.selectedProduct!.id,
      name: productController.selectedProduct!.name,
      price: productController.selectedProduct!.price,
      qty: double.tryParse(tecQty.text) ?? 0,
      categoryModel: productController.selectedProduct!.categoryModel,
      img: '',
    );
    productController.updateData(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FormHeader(
              title: 'Stock Form',
            ),
            TextBox(focusNode: fnQty, controller: tecQty, labelText: 'Qty'),
          ],
        ),
      ),
      floatingActionButton: ButtonSave(
        onPressed: () async {
          await updateData();
          Get.back();
        },
      ),
    );
  }
}
