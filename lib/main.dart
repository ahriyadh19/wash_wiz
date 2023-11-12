import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wash_wiz/pages/main_pages/navigation_control_page.dart';
import 'package:wash_wiz/pages/main_pages/sign_in_page_view.dart';
import 'package:wash_wiz/widgets/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static int userRole = 1; // 0 = admin, 1 = user
  static int style = 1;
  static bool isSingIn = false;
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    super.initState();
    prefs.then((value) {
      MyApp.userRole = value.getInt('user_role') ?? 1;
      MyApp.style = value.getInt('style') ?? 1;
      MyApp.isSingIn = value.getBool('is_sing_in') ?? false;
      debugPrint('isSingIn: ${MyApp.isSingIn}');
      debugPrint('userRole: ${MyApp.userRole}');
      debugPrint('style: ${MyApp.style}');
      setState(() {
        MyApp.isSingIn = MyApp.isSingIn;
        MyApp.userRole = MyApp.userRole;
        MyApp.style = MyApp.style;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wash Wiz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyCustomColor.getColor(optionColor: MyApp.style)),
        useMaterial3: true,
      ),
      home: MyApp.isSingIn ? const NavigationControlPage() : const SignInPageView(),
    );
  }
}
