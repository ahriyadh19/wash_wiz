import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  final String msg;
  final int op;

  const NoData({super.key, required this.msg, required this.op});

  @override
  Widget build(BuildContext context) {
    String backgroundImage;
    switch (op) {
      case 1:
        backgroundImage = 'lib/assets/no_data/1.jpg';
        break;
      case 2:
        backgroundImage = 'lib/assets/no_data/2.jpg';
        break;
      default:
        backgroundImage = 'lib/assets/no_data/2.jpg';
    }
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              msg,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
