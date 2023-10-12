import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pos_setec_system/data/model/sale_model.dart';
import 'package:pos_setec_system/presentation/controller/sale_controller.dart';

import '../../../../widget/button_icon.dart';

class SaleReportList extends StatefulWidget {
  final SaleModel saleModel;
  final Function onSelect;
  final Function onDelete;
  final Function onEdit;
  final int index;
  const SaleReportList({
    super.key,
    required this.saleModel,
    required this.index,
    required this.onSelect,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  State<SaleReportList> createState() => _SaleReportListState();
}

class _SaleReportListState extends State<SaleReportList> {
  final SaleController saleController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelect();
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: widget.saleModel == saleController.selectedSale
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
                    widget.saleModel.invoice,
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
                    widget.saleModel.customerName,
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
                    ' \$ ${widget.saleModel.total.toString()}',
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
                    DateFormat('dd-MM-yy').format(widget.saleModel.createAt),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          letterSpacing: 0.5,
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: Center(
                  child: Text(
                    DateFormat('hh:mm:ss a').format(widget.saleModel.createAt),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          letterSpacing: 0.5,
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
