import 'package:flutter/material.dart';
import 'package:wash_wiz/utilities/constant.dart';

class MyCustomColor {
  static getColor({required int optionColor}) {
    Color color;
    switch (optionColor) {
      case 1:
        color = appTheme[optionColor]['primaryColor'];
        break;
      case 2:
        color = appTheme[optionColor]['primaryColor'];
        break;
      case 3:
        color = appTheme[optionColor]['primaryColor'];
        break;
      default:
        color = appTheme[1]['primaryColor'];
    }
    return color;
  }
}
