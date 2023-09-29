import 'package:flutter/material.dart';

class TextListItemTwoRow extends StatelessWidget {
  const TextListItemTwoRow({
    super.key,
    required this.topRow,
    required this.bottomRow,
    required this.width,
  });
  final String topRow;
  final String bottomRow;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          // color: Colors.red,
          width: width,
          child: Text(
            topRow,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 11),
          ),
        ),
        const SizedBox(
          height: 1,
        ),
        SizedBox(
          width: width,
          child: Text(
            bottomRow,
            style: const TextStyle(fontSize: 11),
          ),
        ),
      ],
    );
  }
}
