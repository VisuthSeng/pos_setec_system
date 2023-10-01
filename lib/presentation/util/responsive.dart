import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget? tablet;
  const Responsive({
    Key? key,
    this.tablet,
  }) : super(key: key);

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (size.width >= 850 && tablet != null) {
      return tablet!;
    } else {
      return tablet!;
    }
  }
}
