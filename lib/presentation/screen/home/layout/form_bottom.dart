import 'package:flutter/material.dart';

class FormBottom extends StatelessWidget {
  final Widget widget;
  const FormBottom({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Column(
        children: [
          Container(
            height: 10,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              border: Border(
                bottom: BorderSide(
                  color: Color.fromARGB(255, 240, 240, 240),
                ),
              ),
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(5),
              //   topRight: Radius.circular(5),
              // ),
            ),
          ),
          widget,
        ],
      ),
    );
  }
}
