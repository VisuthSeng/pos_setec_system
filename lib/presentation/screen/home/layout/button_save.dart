import 'package:flutter/material.dart';

class ButtonSave extends StatelessWidget {
  final bool loading;
  final void Function() onPressed;
  const ButtonSave({
    super.key,
    this.loading = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Tooltip(
        message: 'Save',
        child: loading == false ? const Icon(Icons.edit, color: Colors.white) : const CircularProgressIndicator(),
      ),
    );
  }
}
