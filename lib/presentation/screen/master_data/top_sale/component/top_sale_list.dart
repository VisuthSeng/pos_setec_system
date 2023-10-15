import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pos_setec_system/data/model/product_top_sold.dart';
import 'package:pos_setec_system/presentation/controller/product_top_sold_controller.dart';

import '../../../../widget/button_icon.dart';

class SaleTopList extends StatefulWidget {
  final ProductTopSoldModel saleModel;
  final Function onSelect;
  final Function onDelete;
  final Function onEdit;
  final int index;
  const SaleTopList({
    super.key,
    required this.saleModel,
    required this.index,
    required this.onSelect,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  State<SaleTopList> createState() => _SaleTopListState();
}

class _SaleTopListState extends State<SaleTopList> {
  final ProductTopSoldController productTopSoldController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelect();
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: widget.saleModel ==
                  productTopSoldController.selectedTopSoldProduct
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
                    widget.saleModel.productName,
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
                    widget.saleModel.qty.toString(),
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
                    DateFormat('dd-MM-yy').format(widget.saleModel.date),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
