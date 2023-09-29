import 'package:flutter/material.dart';

import '../../../core/util/app_setting.dart';

class PopUpForm {
  static void fromLeft({
    required BuildContext context,
    double width = 600,
    required Widget child,
  }) {
    showGeneralDialog(
      useRootNavigator: false,
      barrierLabel: "",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        AppSetting.listFormContext.add(context);
        return Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            width: width,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              margin: const EdgeInsets.all(10),
              child: child,
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(-1, 0),
            end: const Offset(0, 0),
          ).animate(anim1),
          child: child,
        );
      },
    );
  }

  static void fromRight({
    required BuildContext context,
    double width = 600,
    required Widget child,
  }) {
    showGeneralDialog(
      useRootNavigator: false,
      barrierLabel: "",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.2),
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        AppSetting.listFormContext.add(context);
        return Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: width,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              margin: const EdgeInsets.all(10),
              child: child,
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(1, 0),
            end: const Offset(0, 0),
          ).animate(anim1),
          child: child,
        );
      },
    );
  }
}
