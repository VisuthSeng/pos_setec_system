import 'package:flutter/material.dart';

class AppColor {
  const AppColor();

  static const primary = Color.fromARGB(255, 7, 106, 255);

  static const bodyText = Color.fromARGB(221, 0, 0, 0);
  static const titleText = Color.fromARGB(221, 54, 54, 54);

  static const shadow = Color(0xffF5F8FA);
  static const background = Color.fromARGB(255, 246, 244, 255);

  static const disable = Color.fromARGB(255, 207, 206, 206);

  //top left menu

  static const unSelectedMenu = Color.fromARGB(255, 240, 240, 240);
  static const selectedMenu = Color.fromARGB(255, 220, 237, 251);

  //table in form list
  static const tableHeader = Color.fromARGB(255, 223, 226, 228);
  static const tableRow = Color(0xffF5F8FA);
  static const tableSelectedRow = Color.fromARGB(255, 220, 237, 251);
  static const tableButton = Color(0xffF5F8FA);

  static List<Color?> listNoteBackGroundColor = [
    Colors.red[100],
    Colors.orange[100],
    Colors.yellow[100],
    Colors.green[100],
    Colors.blue[100],
    Colors.pink[100],
    Colors.purple[100],
    Colors.lightGreen[100],
    Colors.teal[100],
    Colors.brown[100],
  ];
}
