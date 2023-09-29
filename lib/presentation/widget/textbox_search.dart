import 'package:flutter/material.dart';

import '../../../core/constant/app_size.dart';
import '../../../core/constant/font_size.dart';

class TextboxSearch extends StatelessWidget {
  final String label;
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

  const TextboxSearch({
    Key? key,
    this.label = 'tec1',
    this.maxLength = 50,
    this.controller,
    this.focusNode,
    this.onKeyReturn,
    this.onLostFocus,
    this.textInputAction = TextInputAction.done,
    this.isReadOnly = false,
    this.isEnabled = true,
    this.onChanged,
    this.keyboard = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: const BoxDecoration(
        color: Color(0xffEFF2F5),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.textboxRadius),
        ),
      ),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(
                    fontSize: FontSize.textbox,
                  ),
              keyboardType: keyboard,
              readOnly: isReadOnly,
              // enabled: isEnabled,
              textInputAction: textInputAction,
              onSubmitted: (x) {
                if (onKeyReturn != null) {
                  onKeyReturn!();
                }
              },

              focusNode: focusNode,
              onChanged: onChanged,
              maxLength: maxLength,
              controller: controller,
              cursorColor: const Color.fromARGB(255, 155, 155, 155),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                hintText: label,
                counterText: '',
                border: InputBorder.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
