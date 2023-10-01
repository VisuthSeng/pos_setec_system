import 'package:flutter/material.dart';

class LeftMenuItem extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color? iconColor;
  final Function? onSelected;
  final Color? bgColor;

  const LeftMenuItem({
    super.key,
    required this.title,
    required this.icon,
    this.onSelected,
    this.iconColor,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected!();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: bgColor ?? const Color(0xffFFFFFF),
          ),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.purple,
                ),
                width: 2,
                height: 40,
              ),
              const SizedBox(
                width: 20,
              ),
              Icon(
                icon,
                color: iconColor ?? Theme.of(context).primaryColor,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
