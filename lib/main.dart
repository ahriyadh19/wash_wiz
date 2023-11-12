import 'package:flutter/material.dart';
import 'package:wash_wiz/pages/main_pages/navigation_control_page.dart';
import 'package:wash_wiz/widgets/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static int style = 1;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wash Wiz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyCustomColor.getColor(optionColor: style)),
        useMaterial3: true,
      ),
      home: const NavigationControlPage(),
    );
  }
}
