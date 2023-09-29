import 'package:flutter/material.dart';

import '../../../../core/constant/app_color.dart';

class FormListButton extends StatelessWidget {
  final bool access;
  final String title;
  final IconData icon;
  final Color color;
  final void Function() onTap;
  const FormListButton({
    Key? key,
    this.access = true,
    required this.title,
    required this.icon,
    required this.color,
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
                  title,
                  style:
                      Theme.of(context).primaryTextTheme.titleLarge!.copyWith(
                            fontSize: 15,
                          ),
                )
              : Text(
                  title,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .titleLarge!
                      .copyWith(fontSize: 15, color: AppColor.disable),
                ),
          icon: Icon(
            icon,
            size: 20,
            color: access ? color : AppColor.disable,
          ),
        ),
      ),
    );
  }
}
