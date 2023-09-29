import 'package:flutter/material.dart';

class FormListHeaderItem extends StatefulWidget {
  final double width;
  final String title;
  final EdgeInsets padding;
  final double fontSize;

  const FormListHeaderItem({
    Key? key,
    required this.width,
    required this.title,
    this.padding = const EdgeInsets.all(0),
    this.fontSize = 14,
  }) : super(key: key);

  @override
  State<FormListHeaderItem> createState() => _FormListHeaderItemState();
}

class _FormListHeaderItemState extends State<FormListHeaderItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Padding(
        padding: widget.padding,
        child: Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: widget.fontSize,
              ),
        ),
      ),
    );
  }
}
