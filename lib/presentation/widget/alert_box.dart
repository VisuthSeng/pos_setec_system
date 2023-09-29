import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/util/app_setting.dart';

class AlertBox {
  static warning({required String message, double width = 500}) {
    ScaffoldMessenger.of(AppSetting.navigatorKey.currentContext!)
        .clearSnackBars();
    ScaffoldMessenger.of(AppSetting.navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        width: width,
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Container(
          color: Colors.transparent,
          height: 200,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5),
              ),
              height: 80,
              width: width,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
                    child: Icon(
                      CupertinoIcons.exclamationmark_shield,
                      color: Colors.blue.shade400,
                      size: 35,
                    ),
                  ),
                  Center(
                    child: AutoSizeText(
                      message,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static error({required String message, double width = 500}) {
    ScaffoldMessenger.of(AppSetting.navigatorKey.currentContext!)
        .clearSnackBars();
    ScaffoldMessenger.of(AppSetting.navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        width: width,
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Container(
          color: Colors.transparent,
          height: 200,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5),
              ),
              height: 80,
              width: width,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
                    child: Icon(
                      CupertinoIcons.multiply_circle,
                      color: Colors.red.shade400,
                      size: 35,
                    ),
                  ),
                  Center(
                    child: AutoSizeText(
                      message,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static success({required String message, double width = 500}) {
    ScaffoldMessenger.of(AppSetting.navigatorKey.currentContext!)
        .clearSnackBars();
    ScaffoldMessenger.of(AppSetting.navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        width: width,
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Container(
          color: Colors.transparent,
          height: 200,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5),
              ),
              height: 80,
              width: width,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
                    child: Icon(
                      CupertinoIcons.checkmark_alt_circle,
                      color: Colors.green.shade700,
                      size: 35,
                    ),
                  ),
                  Center(
                    child: AutoSizeText(
                      message,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
