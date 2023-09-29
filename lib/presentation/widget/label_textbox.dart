import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constant/app_color.dart';

class LabelTextBox extends StatelessWidget {
  const LabelTextBox({
    super.key,
    required this.label,
    required this.focusNode,
    required this.controller,
    this.readOnly = false,
    this.onChanged,
    this.labelFontSize = 12,
    this.textFontSize = 12,
    this.onTap,
  });

  final String label;

  final FocusNode focusNode;
  final TextEditingController controller;
  final bool readOnly;
  final Function(String)? onChanged;
  final double labelFontSize;
  final double textFontSize;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 400,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).primaryTextTheme.titleLarge!.copyWith(
                    color: AppColor.bodyText,
                    fontSize: labelFontSize,
                  ),
            ),

            SizedBox(
              width: 150,
              child: TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.deny(RegExp('^0+')),
                  FilteringTextInputFormatter.allow(
                      RegExp(r'(^\d*\.?\d{0,2})')),
                ],
                onChanged: onChanged,
                style: Theme.of(context).primaryTextTheme.titleLarge!.copyWith(
                      fontSize: textFontSize,
                    ),
                controller: controller,
                onTap: onTap,
                readOnly: readOnly,
                textAlign: TextAlign.end,
                decoration: const InputDecoration(
                  fillColor: Colors.grey,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  isDense: true,
                ),
              ),
            ),

            // GestureDetector(
            //   onTap: onTap,
            //   child: Text(
            //     controller.text,
            //     style: Theme.of(context).primaryTextTheme.titleLarge!.copyWith(
            //           color: AppColor.bodyText,
            //           fontSize: textFontSize,
            //         ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
