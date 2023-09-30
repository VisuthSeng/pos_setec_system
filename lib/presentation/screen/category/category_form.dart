import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_setec_system/core/util/Uid.dart';
import 'package:pos_setec_system/data/model/category_model.dart';
import 'package:pos_setec_system/data/model/product_model.dart';
import 'package:pos_setec_system/presentation/controller/category_controller.dart';
import 'package:pos_setec_system/presentation/screen/home/layout/button_save.dart';
import 'package:pos_setec_system/presentation/screen/home/layout/form_header.dart';
import 'package:pos_setec_system/presentation/widget/textbox.dart';

class CategoryForm extends StatefulWidget {
  final bool closeFormWhenSuccess;

  final void Function()? onSavedComplete;

  const CategoryForm({
    Key? key,
    this.closeFormWhenSuccess = false,
    this.onSavedComplete,
  }) : super(key: key);

  @override
  State<CategoryForm> createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  final CategoryController categoryController = Get.find();

  late TextEditingController tecName;
  late TextEditingController tecNote;

  late FocusNode fnName;
  late FocusNode fnNote;

  bool errorCategoryBlank = false;
  bool errorCategoryExist = false;

  bool loading = false;

  @override
  void initState() {
    tecName = TextEditingController();
    tecNote = TextEditingController();

    fnName = FocusNode();
    fnNote = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    tecName.dispose();
    tecNote.dispose();

    fnName.dispose();
    fnNote.dispose();

    super.dispose();
  }

  Future<void> saveData() async {
    var model = CategoryModel(
      id: UId.getId(),
      name: tecName.text,
      listProduct: [
        ProductModel(id: UId.getId(), name: 'Orange', price: 2, qty: 10),
        ProductModel(id: UId.getId(), name: 'Banana', price: 2, qty: 10),
      ],
    );
    await categoryController.saveData(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FormHeader(
              title: 'Category Form',
            ),
            TextBox(
                focusNode: fnName, controller: tecName, labelText: 'Categroy'),
          ],
        ),
      ),
      floatingActionButton: ButtonSave(onPressed: () async {
        await saveData();
        Get.back();
      }),
    );
  }
}
