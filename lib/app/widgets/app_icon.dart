import 'package:flutter/material.dart';
import 'package:wash_wiz/utilities/constant.dart';

class AppIcon extends StatelessWidget {
  final int optionImage;

  const AppIcon({super.key, required this.optionImage});

  @override
  Widget build(BuildContext context) {
    String imagePath;
    switch (optionImage) {
      case 1:
        imagePath = appTheme[optionImage]['logo'];
        break;
      case 2:
        imagePath = appTheme[optionImage]['logo'];
        break;
      case 3:
        imagePath = appTheme[optionImage]['logo'];
        break;
      default:
        imagePath = appTheme[1]['logo'];
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
