import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String title;
  final String tooltip;
  final Function onPress;
  final double? width;
  final double? height;

  const ButtonText({
    super.key,
    required this.title,
    required this.tooltip,
    required this.onPress,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 150,
      height: height ?? 50,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orangeAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: () {
          onPress();
        },
        child: Text(
          title,
          style: Theme.of(context).primaryTextTheme.titleLarge!.copyWith(
                fontSize: 15,
              ),
        ),
      ),
    );
  }
}
