import 'package:flutter/material.dart';

import '../../../core/constant/app_size.dart';

class LabelTextboxBrowse extends StatelessWidget {
  final bool secureText;
  final String hintText;
  final TextAlign textAlign;
  final bool fullBrowse;
  final void Function()? onBrowse;
  final bool showIcon;
  final bool error;
  final double height;
  final String label;
  final double labelSpace;
  final int maxLength;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function()? onKeyReturn;
  final void Function()? onLostFocus;
  final TextInputAction textInputAction;
  final bool isReadOnly;
  final bool isEnabled;
  final void Function(String value)? onChanged;
  final TextInputType keyboard;
  final double textWidth;
  final double fontSize;

  final double labelFontSize;
  final bool canType;
  final EdgeInsetsGeometry padding;
  final Widget icon;
  final EdgeInsetsGeometry contentPadding;
  final String errorText;

  const LabelTextboxBrowse({
    Key? key,
    this.secureText = false,
    this.hintText = '',
    this.textAlign = TextAlign.left,
    this.fullBrowse = false,
    this.onBrowse,
    this.showIcon = false,
    this.error = false,
    this.height = 50,
    required this.label,
    this.labelSpace = 80,
    this.maxLength = 500,
    this.controller,
    this.focusNode,
    this.onKeyReturn,
    this.onLostFocus,
    this.textInputAction = TextInputAction.done,
    this.isReadOnly = true,
    this.isEnabled = true,
    this.onChanged,
    this.keyboard = TextInputType.text,
    this.textWidth = 80,
    this.labelFontSize = 18,
    this.errorText = '',
    this.canType = false,
    this.padding = const EdgeInsets.only(
      top: 20,
      left: 20,
      right: 20,
    ),
    this.icon = const Icon(Icons.arrow_drop_down_sharp, size: 28),
    this.contentPadding = const EdgeInsets.only(),
    this.fontSize = 13,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.textboxRadius),
          ),
          border: Border.all(
            color: error ? Colors.red : Colors.transparent,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 5,
              bottom: 5,
              child: icon,
            ),
            Positioned.fill(
              child: TextField(
                style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(
                      fontSize: fontSize,
                    ),
                // keyboardType: TextInputType.multiline,
                readOnly: isReadOnly,
                focusNode: focusNode,
                onChanged: (c) {},
                controller: controller,
                onTap: canType ? null : onBrowse,
                cursorColor: const Color.fromARGB(255, 155, 155, 155),
                decoration: InputDecoration(
                  // errorText: error ? errorText : null,
                  labelText: label,
                  labelStyle: TextStyle(fontSize: labelFontSize, height: 0),
                  // errorBorder: error
                  //     ? const UnderlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.red, width: 1.0),
                  //       )
                  //     : null,

                  isDense: false,
                  contentPadding: contentPadding,

                  // border: InputBorder.none,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
