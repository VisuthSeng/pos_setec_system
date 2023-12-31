import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_setec_system/presentation/controller/category_controller.dart';
import '../../../../core/util/Uid.dart';
import '../../../../data/model/category_model.dart';
import '../../../../data/model/product_model.dart';
import '../../../controller/product_controller.dart';
import '../../home/layout/button_save.dart';
import '../../home/layout/form_header.dart';
import '../../../util/browse_category.dart';
import '../../../widget/label_textbox_browse.dart';
import '../../../widget/pop_up_form.dart';
import '../../../widget/textbox.dart';

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
  final CategoryController categoryController = Get.find();

  late CategoryModel categoryModel;

  late ProductModel productModel;

  List<ProductModel> listProduct = [];

  late TextEditingController tecName;
  late TextEditingController tecCategory;
  late TextEditingController tecPrice;
  late TextEditingController tecImg;

  late FocusNode fnName;
  late FocusNode fnCategory;
  late FocusNode fnPrice;
  late FocusNode fnImg;

  bool loading = false;

  @override
  void initState() {
    tecName = TextEditingController();
    tecCategory = TextEditingController();
    tecPrice = TextEditingController();
    tecImg = TextEditingController();

    fnName = FocusNode();
    fnCategory = FocusNode();
    fnPrice = FocusNode();
    fnImg = FocusNode();

    if (widget.formEdit == true) {
      productModel = productController.selectedProduct!;
      tecName.text = productController.selectedProduct!.name;
      categoryModel = productController.selectedProduct!.categoryModel;
      tecCategory.text = productController.selectedProduct!.categoryModel.name;
      tecPrice.text = productController.selectedProduct!.price.toString();
      tecImg.text = productController.selectedProduct!.img;
    }

    super.initState();
  }

  @override
  void dispose() {
    tecName.dispose();
    tecCategory.dispose();
    tecPrice.dispose();

    fnName.dispose();
    fnCategory.dispose();
    fnPrice.dispose();

    super.dispose();
  }

  Future<void> saveData() async {
    var model = ProductModel(
      id: UId.getId(),
      name: tecName.text,
      price: double.tryParse(tecPrice.text) ?? 0,
      qty: 0,
      categoryModel: categoryModel,
      img: tecImg.text,
    );

    productController.saveData(model);
  }

  Future<void> updateData() async {
    var model = ProductModel(
      id: productController.selectedProduct!.id,
      name: tecName.text,
      price: double.tryParse(tecPrice.text) ?? 0,
      qty: productController.selectedProduct!.qty,
      categoryModel: categoryModel,
      img: tecImg.text,
    );

    productController.updateData(model);
  }

  void browseCategory(BuildContext context) {
    PopUpForm.fromRight(
      context: context,
      child: BrowseCategory(
        onSelected: (model) {
          setState(() {
            categoryModel = model;
            tecCategory.text = model.name;
          });
        },
      ),
    );
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
            LabelTextboxBrowse(
              controller: tecCategory,
              focusNode: fnCategory,
              label: 'Category',
              hintText: tecCategory.text,
              onBrowse: () {
                browseCategory(context);
              },
            ),
            TextBox(focusNode: fnImg, controller: tecImg, labelText: 'Image'),
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
