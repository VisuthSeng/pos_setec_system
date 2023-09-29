import 'package:flutter/material.dart';

class MessageButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final void Function() onTap;
  const MessageButton({
    Key? key,
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
          onPressed: onTap,
          label: Text(
            title,
            style: Theme.of(context).primaryTextTheme.titleLarge!.copyWith(
                  fontSize: 15,
                ),
          ),
          icon: Icon(icon, size: 20, color: color),
        ),
      ),
    );
  }
}
