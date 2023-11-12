import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:wash_wiz/main.dart';
import 'package:wash_wiz/pages/main_pages/sign_in_page_view.dart';
import 'package:wash_wiz/pages/sub_pages/add_sub_page.dart';
import 'package:wash_wiz/pages/sub_pages/history_sub_page.dart';
import 'package:wash_wiz/pages/sub_pages/home_sub_page.dart';
import 'package:wash_wiz/pages/sub_pages/profile_sub_page.dart';
import 'package:wash_wiz/widgets/colors.dart';

class NavigationControlPage extends StatefulWidget {
  const NavigationControlPage({super.key});

  @override
  State<NavigationControlPage> createState() => _NavigationControlPageState();
}

class _NavigationControlPageState extends State<NavigationControlPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomeSubPage(),
    HistorySubPage(),
    AddSubPage(),
    ProfileSubPage(),
  ];
  final List<String> _titles = const [
    'Home',
    'History',
    'Add',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: upBar(),
      drawer: myDrawer(),
      body: _pages[_currentIndex],
      bottomNavigationBar: bottomNavBar(),
    );
  }

  AppBar upBar() {
    return AppBar(
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: MyCustomColor.getColor(optionColor: MyApp.style),
        iconTheme: const IconThemeData(color: Colors.white));
  }

  bottomNavBar() {
    return SalomonBottomBar(
      duration: const Duration(seconds: 2),
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: const Icon(Icons.home),
          title: const Text('Home'),
          selectedColor: MyCustomColor.getColor(optionColor: MyApp.style),
        ),

        /// History
        SalomonBottomBarItem(
          icon: const Icon(Icons.history_rounded),
          title: const Text('History'),
          selectedColor: MyCustomColor.getColor(optionColor: MyApp.style),
        ),

        /// Add
        SalomonBottomBarItem(
          icon: const Icon(Icons.add),
          title: const Text('Add'),
          selectedColor: MyCustomColor.getColor(optionColor: MyApp.style),
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: const Icon(Icons.person),
          title: const Text('Profile'),
          selectedColor: MyCustomColor.getColor(optionColor: MyApp.style),
        ),
      ],
    );
  }

  Drawer myDrawer() {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: MyCustomColor.getColor(optionColor: MyApp.style),
            child: const Center(
              child: Text(
                'Wash Wiz',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.history_rounded),
            title: const Text('History'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Add'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Spacer(),
          Column(
            children: [
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Sign Out'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const SignInPageView()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
