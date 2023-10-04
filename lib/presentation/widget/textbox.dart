import 'package:flutter/material.dart';

class TextBox extends StatefulWidget {
  const TextBox({
    super.key,
    required this.focusNode,
    required this.controller,
    required this.labelText,
    this.icon,
    this.isError = false,
    this.errorText = '',
    this.labelFontSize = 14,
    this.width = double.infinity,
    this.padding = const EdgeInsets.only(
      left: 20,
      top: 20,
      right: 20,
    ),
    this.readOnly = false,
    this.maxLines = 1,
    this.fontSize = 15,
    this.contentPadding = const EdgeInsets.only(
      top: 0,
    ),
    this.height = 45,
  });

  final FocusNode focusNode;
  final TextEditingController controller;
  final String labelText;
  final bool isError;
  final String errorText;
  final IconButton? icon;
  final double labelFontSize;
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final bool readOnly;
  final int? maxLines;
  final double fontSize;
  final EdgeInsetsGeometry contentPadding;

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  @override
  void initState() {
    widget.focusNode.addListener(_clearTextOnTap);
    super.initState();
  }

  void _clearTextOnTap() {
    if (widget.focusNode.hasFocus) {
      widget.controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: SizedBox(
        width: widget.width,
        child: TextField(
          style: Theme.of(context)
              .primaryTextTheme
              .bodyLarge!
              .copyWith(fontSize: widget.fontSize, color: Colors.black),
          maxLines: widget.maxLines,
          readOnly: widget.readOnly,
          cursorHeight: 20,
          focusNode: widget.focusNode,
          controller: widget.controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: const BorderSide(
                width: 3,
                color: Color.fromARGB(255, 194, 183, 183),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: const BorderSide(
                width: 3,
                color: Colors.blue, // Change to the color you want when focused
              ),
            ),
            errorText: widget.isError ? widget.errorText : null,
            labelText: widget.labelText,
          ),
        ),
      ),
    );
  }
}
