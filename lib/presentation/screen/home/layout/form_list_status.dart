import 'package:flutter/material.dart';

import '../../../../core/constant/app_color.dart';

class FormListStatus extends StatelessWidget {
  final String text;

  final Color? color;
  final Color? backgroundColor;
  final Widget leading;

  const FormListStatus({
    Key? key,
    required this.text,
    this.color,
    this.backgroundColor,
    required this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColor.shadow,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: 30,
              height: 30,
              child: leading,
            ),
          ),
          Text(text),
        ],
      ),
    );
  }
}
