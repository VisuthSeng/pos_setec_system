import 'package:flutter/material.dart';

import '../../../../../core/constant/app_color.dart';

class ButtonMain extends StatelessWidget {
  final bool access;
  final String text;
  final void Function() onTap;
  const ButtonMain({
    Key? key,
    this.access = true,
    required this.onTap,
    required this.text,
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
                  text,
                  style:
                      Theme.of(context).primaryTextTheme.titleLarge!.copyWith(
                            fontSize: 15,
                          ),
                )
              : Text(
                  text,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .titleLarge!
                      .copyWith(fontSize: 15, color: AppColor.disable),
                ),
          icon: Icon(
            Icons.add_box,
            size: 20,
            color: access ? Colors.green : AppColor.disable,
          ),
        ),
      ),
    );
  }
}
