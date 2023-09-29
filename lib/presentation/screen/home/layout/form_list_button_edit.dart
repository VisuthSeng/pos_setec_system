import 'package:flutter/material.dart';

import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_language.dart';

class FormListButtonEdit extends StatelessWidget {
  final bool access;
  final void Function() onTap;
  const FormListButtonEdit({
    Key? key,
    this.access = true,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        height: 45,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          onPressed: access ? onTap : () {},
          label: access
              ? Text(
                  AppLanguage.edit,
                  style:
                      Theme.of(context).primaryTextTheme.titleLarge!.copyWith(
                            fontSize: 15,
                          ),
                )
              : Text(
                  AppLanguage.edit,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .titleLarge!
                      .copyWith(fontSize: 15, color: AppColor.disable),
                ),
          icon: Icon(
            Icons.edit_note_sharp,
            size: 20,
            color: access
                ? const Color.fromARGB(255, 255, 145, 0)
                : AppColor.disable,
          ),
        ),
      ),
    );
  }
}
