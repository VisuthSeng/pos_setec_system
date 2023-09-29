import 'package:flutter/material.dart';

import '../../../core/constant/app_color.dart';

class Loading extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color? color;
  final Color? backgroundColor;

  const Loading({
    Key? key,
    required this.text,
    this.width = 200,
    this.height = 150,
    this.color,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColor.shadow,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              strokeWidth: 5,
              color: color ?? Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(text),
        ],
      ),
    );
  }
}
