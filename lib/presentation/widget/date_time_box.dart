import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/app_size.dart';
import '../../../core/constant/font_size.dart';

class DateTimeBox extends StatelessWidget {
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

  final double labelFontSize;
  final bool canType;
  final EdgeInsetsGeometry padding;

  const DateTimeBox({
    Key? key,
    this.secureText = false,
    this.hintText = '',
    this.textAlign = TextAlign.left,
    this.fullBrowse = false,
    this.onBrowse,
    this.showIcon = false,
    this.error = false,
    this.height = 38,
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
    this.canType = false,
    this.padding = const EdgeInsets.only(
      top: 20,
      left: 20,
      right: 20,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: padding,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(AppSize.textboxRadius),
            ),
            border: Border.all(
              color: error ? Colors.red : Colors.transparent,
            ),
          ),
          child: Center(
            child: TextField(
              style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(
                    fontSize: FontSize.textbox,
                  ),
              keyboardType: TextInputType.multiline,
              readOnly: isReadOnly,
              focusNode: focusNode,
              onChanged: (c) {},
              controller: controller,
              onTap: canType ? null : onBrowse,
              cursorColor: const Color.fromARGB(255, 155, 155, 155),
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(fontSize: labelFontSize),
                // errorBorder: isError
                //     ? const OutlineInputBorder(
                //         borderSide:
                //             BorderSide(color: Colors.red, width: 1.0),
                //       )
                //     : null,
                suffixIcon: IconButton(
                  padding: const EdgeInsets.only(bottom: 2, left: 2),
                  onPressed: onBrowse,
                  icon: const Icon(
                    CupertinoIcons.calendar,
                    size: 28,
                    color: Colors.black54,
                  ),
                ),

                contentPadding:
                    const EdgeInsets.only(right: 0, left: 0, top: 0, bottom: 0),
                hintText: hintText,
                counterText: '',
                // border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
