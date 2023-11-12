import 'package:flutter/material.dart';
import 'package:wash_wiz/main.dart';
import 'package:wash_wiz/pages/main_pages/navigation_control_page.dart';

class SettingsSubPage extends StatefulWidget {
  const SettingsSubPage({super.key});

  @override
  State<SettingsSubPage> createState() => _SettingsSubPageState();
}

class _SettingsSubPageState extends State<SettingsSubPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('App Theme'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildColumn('lib/assets/1/bg1.jpg', 1),
              buildColumn('lib/assets/2/bg2.jpg', 2),
              buildColumn('lib/assets/3/bg3.jpg', 3),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildColumn(String imagePath, int style) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              MyApp.style = style;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const NavigationControlPage()),
              );
            });
          },
          child: Image.asset(
            imagePath,
            width: MediaQuery.of(context).size.width / 3.2,
            height: MediaQuery.of(context).size.width / 3.2,
          ),
        ),
        Radio(
          value: style,
          groupValue: MyApp.style,
          onChanged: (value) {
            setState(() {
              MyApp.style = value as int;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const NavigationControlPage()),
              );
            });
          },
        ),
      ],
    );
  }
}
