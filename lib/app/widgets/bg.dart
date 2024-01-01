import 'package:flutter/material.dart';

class BG extends StatelessWidget {
  final Widget child;
  final int optionImage;

  const BG({super.key, required this.child, required this.optionImage});

  @override
  Widget build(BuildContext context) {
    String backgroundImage;
    switch (optionImage) {
      case 1:
        backgroundImage = 'lib/assets/1/bg1.jpg';
        break;
      case 2:
        backgroundImage = 'lib/assets/2/bg2.jpg';
        break;
      case 3:
        backgroundImage = 'lib/assets/3/bg3.jpg';
        break;
      default:
        backgroundImage = 'lib/assets/2/bg2.jpg';
    }
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
