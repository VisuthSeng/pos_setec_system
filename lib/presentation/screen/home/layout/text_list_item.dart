
import 'package:flutter/material.dart';

class TextListItem extends StatelessWidget {
  final String title;
  final EdgeInsets padding;
  final double width;
  final double fontSize;
  const TextListItem({
    Key? key,
    required this.title,
    this.padding = const EdgeInsets.only(right: 5),
    required this.width,
    this.fontSize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      width: width,
      child: Padding(
        padding: padding,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: fontSize),
        ),
      ),
    );
  }
}
