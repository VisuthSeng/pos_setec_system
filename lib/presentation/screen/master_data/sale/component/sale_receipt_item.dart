import 'package:flutter/material.dart';

class SaleReceipt extends StatelessWidget {
  const SaleReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          width: 260,
          child: Text(
            'Product',
            style: TextStyle(fontSize: 13),
          ),
        ),
        SizedBox(
          width: 130,
          child: Text(
            'Customer',
            style: TextStyle(fontSize: 13),
          ),
        ),
        SizedBox(
          width: 100,
          child: Text(
            'Unit Price',
            style: TextStyle(fontSize: 13),
          ),
        ),
        SizedBox(
          width: 100,
          child: Text(
            'Amount',
            style: TextStyle(fontSize: 13),
          ),
        ),
      ],
    );
  }
}
