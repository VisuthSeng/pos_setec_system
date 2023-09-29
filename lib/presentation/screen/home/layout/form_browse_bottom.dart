import 'package:flutter/material.dart';
import '../../../../core/constant/app_size.dart';

class FormBrowseBottom extends StatelessWidget {
  final Function()? onCancel;
  final Function()? onChoose;
  const FormBrowseBottom({
    Key? key,
    this.onCancel,
    this.onChoose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: AppSize.formBottom,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // FormListButton(
          //   icon: Icons.close_rounded,
          //   color: const Color.fromRGBO(244, 67, 54, 1),
          //   title: AppLanguage.cancel.ts,
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ],
      ),
    );
  }
}
