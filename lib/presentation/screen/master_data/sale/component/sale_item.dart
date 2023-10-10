import 'package:flutter/material.dart';

import '../../../../../data/model/product_model.dart';

class SaleItem extends StatefulWidget {
  const SaleItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.item,
    required this.productModel,
    required this.onPress,
  });

  final String image;
  final String title;
  final String price;
  final String item;
  final ProductModel productModel;
  final Function onPress;

  @override
  State<SaleItem> createState() => _SaleItemState();
}

class _SaleItemState extends State<SaleItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPress();
      },
      child: Container(
        margin: const EdgeInsets.only(right: 5, bottom: 5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: const Color(0xff1f2029),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  widget.image,
                  width: double.infinity,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.productModel.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ${widget.productModel.price.toString()}',
                  style: const TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 12,
                  ),
                ),
                Text(
                  widget.productModel.qty.toString(),
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
