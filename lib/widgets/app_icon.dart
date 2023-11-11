import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final int optionImage;

  const AppIcon({Key? key, required this.optionImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath;
    switch (optionImage) {
      case 1:
        imagePath = 'lib/assets/1/logo-no-bg.png';
        break;
      case 2:
        imagePath = 'lib/assets/2/logo-no-bg.png';
        break;
      case 3:
        imagePath = 'lib/assets/3/logo-no-bg.png';
        break;
      default:
        imagePath = 'lib/assets/1/logo-no-bg.png';
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
