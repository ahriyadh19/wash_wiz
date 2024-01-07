import 'package:flutter/material.dart';
import 'package:wash_wiz/utilities/constant.dart';

class BG extends StatelessWidget {
  final Widget child;
  final int optionImage;

  const BG({super.key, required this.child, required this.optionImage});

  @override
  Widget build(BuildContext context) {
    String backgroundImage;
    switch (optionImage) {
      case 1:
        backgroundImage = appTheme[optionImage]['bg'];
        break;
      case 2:
        backgroundImage = appTheme[optionImage]['bg'];
        break;
      case 3:
        backgroundImage = appTheme[optionImage]['bg'];
        break;
      default:
        backgroundImage = appTheme[1]['bg'];
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
