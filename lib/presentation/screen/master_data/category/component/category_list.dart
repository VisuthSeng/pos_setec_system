import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_setec_system/data/model/category_model.dart';
import 'package:pos_setec_system/presentation/controller/category_controller.dart';
import 'package:pos_setec_system/presentation/widget/button_icon.dart';

class CategoryList extends StatefulWidget {
  final CategoryModel categoryModel;
  final Function onSelect;
  final Function onDelete;
  final Function onEdit;
  final int index;
  const CategoryList({
    super.key,
    required this.categoryModel,
    required this.index,
    required this.onSelect,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final CategoryController categoryController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelect();
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: widget.categoryModel == categoryController.selectedCategory
              ? Colors.blue.withOpacity(0.2)
              : Colors.transparent,
          border: const Border(
            bottom: BorderSide(
              color: Color.fromARGB(255, 192, 188, 188),
            ),
          ),
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
                  '${widget.index + 1}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 13,
                      ),
                ),
              ),
              SizedBox(
                width: 150,
                child: Center(
                  child: Text(
                    widget.categoryModel.name,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: Center(
                  child: Text(
                    widget.categoryModel.listProduct.length.toString(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
              ButtonIcon(
                  icon: Icons.delete_forever,
                  iconColor: Colors.red,
                  onPress: () {
                    widget.onDelete();
                  }),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ButtonIcon(
                    icon: Icons.edit,
                    iconColor: Colors.blueAccent,
                    onPress: () {
                      widget.onEdit();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
