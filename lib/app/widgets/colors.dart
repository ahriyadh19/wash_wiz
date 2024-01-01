import 'package:flutter/material.dart';

class MyCustomColor {
  static getColor({required int optionColor}) {
    Color color;
    switch (optionColor) {
      case 1:
        color = const Color.fromRGBO(9, 81, 146, 1);
        break;
      case 2:
        color = const Color.fromRGBO(106, 206, 222, 1);
        break;
      case 3:
        color = const Color.fromRGBO(89, 153, 201, 1);
        break;
      default:
        color = const Color.fromRGBO(106, 206, 222, 1);
    }
    return color;
  }
}
