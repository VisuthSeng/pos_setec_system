import 'package:flutter/material.dart';

class SaleHeaderItemTab extends StatefulWidget {
  const SaleHeaderItemTab({
    super.key,
    required this.icon,
    required this.title,
    required this.isActive,
    this.ontap,
    required this.color,
  });

  final String icon;
  final String title;
  final bool isActive;
  final Function? ontap;
  final Color color;

  @override
  State<SaleHeaderItemTab> createState() => _SaleHeaderItemTabState();
}

class _SaleHeaderItemTabState extends State<SaleHeaderItemTab> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.ontap!();
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.color,
          border: widget.isActive
              ? Border.all(color: Colors.deepOrangeAccent, width: 3)
              : Border.all(color: const Color(0xff1f2029), width: 3),
        ),
        child: Row(
          children: [
            Image.asset(
              widget.icon,
              width: 30,
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 120,
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
