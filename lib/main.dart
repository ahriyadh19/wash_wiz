import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wash_wiz/pages/main_pages/navigation_control_page.dart';
import 'package:wash_wiz/pages/main_pages/sign_in_page_view.dart';
import 'package:wash_wiz/widgets/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // the configuration of the app is stored in the static variables to be controlled in the whole app
  static int userRole = 1; // 0 = admin, 1 = user
  static int style = 1;
  static bool sessionStarted = false;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          userRole = snapshot.data?.getInt('user_role') ?? 1;
          style = snapshot.data?.getInt('style') ?? 1;
          sessionStarted = snapshot.data?.getBool('session_started') ?? false;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Wash Wiz',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: MyCustomColor.getColor(optionColor: style)),
              useMaterial3: true,
            ),
            home: sessionStarted ? const NavigationControlPage() : const SignInPageView(),
          );
        }
      },
    );
  }
}