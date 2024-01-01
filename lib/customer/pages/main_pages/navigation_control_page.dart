import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wash_wiz/main.dart';
import 'package:wash_wiz/customer/pages/sub_pages/request_sub_page.dart';
import 'package:wash_wiz/customer/pages/sub_pages/history_sub_page.dart';
import 'package:wash_wiz/customer/pages/sub_pages/news_sub_page.dart';
import 'package:wash_wiz/customer/pages/sub_pages/profile_sub_page.dart';
import 'package:wash_wiz/widgets/colors.dart';

class NavigationControlPage extends StatefulWidget {
  const NavigationControlPage({super.key});

  @override
  State<NavigationControlPage> createState() => _NavigationControlPageState();
}

class _NavigationControlPageState extends State<NavigationControlPage> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  Widget _currentBody = const NewsSubPage();
  //String _currentTitle = 'News';
  int _currentIndex = 0;
  Color myCustomColor = MyCustomColor.getColor(optionColor: MyApp.style);
  final List<Widget> _pages = const [
    NewsSubPage(),
    HistorySubPage(),
    RequestSubPage(),
    ProfileSubPage(), // must be in the last index of the list always
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentBody,
      bottomNavigationBar: bottomNavBar(),
    );
  }


  bottomNavBar() {
    return SalomonBottomBar(
      duration: const Duration(seconds: 2),
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          _currentBody = _pages[index];
          // _currentTitle = _titles[index];
        });
      },
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: const Icon(Icons.newspaper_rounded),
          title: const Text('News'),
          selectedColor: myCustomColor,
        ),

        /// History
        SalomonBottomBarItem(
          icon: const Icon(Icons.history_rounded),
          title: const Text('History'),
          selectedColor: myCustomColor,
        ),

        /// Request
        SalomonBottomBarItem(
          icon: const Icon(Icons.cleaning_services_rounded),
          title: const Text('Request'),
          selectedColor: myCustomColor,
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: const Icon(Icons.person),
          title: const Text('Profile'),
          selectedColor: myCustomColor,
        ),
      ],
    );
  }
}
