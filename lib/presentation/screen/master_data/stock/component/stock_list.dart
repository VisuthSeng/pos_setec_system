import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../data/model/product_model.dart';
import '../../../../controller/product_controller.dart';
import '../../../../widget/button_icon.dart';

class StockList extends StatefulWidget {
  final ProductModel productModel;
  final Function onSelect;
  final Function? onDelete;
  final Function onEdit;
  final int index;
  const StockList({
    super.key,
    required this.productModel,
    required this.index,
    required this.onSelect,
    this.onDelete,
    required this.onEdit,
  });

  @override
  State<StockList> createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  final ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelect();
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: widget.productModel == productController.selectedProduct
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
                    widget.productModel.name,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: Center(
                  child: Text(
                    widget.productModel.categoryModel.name,
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
                    widget.productModel.qty.toString(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (widget.onDelete != null)
                      ButtonIcon(
                          icon: Icons.delete_forever,
                          iconColor: Colors.red,
                          onPress: () {
                            widget.onDelete!();
                          }),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: ButtonIcon(
                          icon: Icons.edit,
                          iconColor: Colors.blueAccent,
                          onPress: () {
                            widget.onEdit();
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
