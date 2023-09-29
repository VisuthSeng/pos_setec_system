import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberBox extends StatelessWidget {
  const NumberBox({
    super.key,
    required this.focusNode,
    required this.controller,
    required this.labelText,
    this.padding = const EdgeInsets.only(
      left: 20,
      top: 20,
      right: 20,
    ),
  });

  final FocusNode focusNode;
  final TextEditingController controller;
  final String labelText;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextField(
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
        ],
        cursorHeight: 20,
        focusNode: focusNode,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 13,
              ),
          contentPadding: const EdgeInsets.only(
            top: 0,
          ),
        ),
      ),
    );
  }
}
