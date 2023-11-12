import 'package:flutter/material.dart';
import 'package:wash_wiz/main.dart';
import 'package:wash_wiz/pages/main_pages/forget_password_page_view.dart';
import 'package:wash_wiz/pages/main_pages/navigation_control_page.dart';
import 'package:wash_wiz/pages/main_pages/sign_up_page_view.dart';
import 'package:wash_wiz/widgets/app_icon.dart';
import 'package:wash_wiz/widgets/bg.dart';
import 'package:wash_wiz/widgets/colors.dart';
import 'package:wash_wiz/widgets/input_design.dart';

class SignInPageView extends StatefulWidget {
  const SignInPageView({super.key});

  @override
  State<SignInPageView> createState() => _SignInPageViewState();
}

class _SignInPageViewState extends State<SignInPageView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final int style = MyApp.style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BG(
        optionImage: style,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppIcon(optionImage: style),
                  buildSingInForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column buildSingInForm() {
    return Column(
      children: [
        InputDesign(
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
          obscureText: false,
          controller: emailController,
          prefixIcon: const Icon(Icons.email_rounded),
        ),
        const SizedBox(height: 16),
        InputDesign(
          hintText: 'Password',
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          controller: passwordController,
          prefixIcon: const Icon(Icons.lock),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const NavigationControlPage()),
            );
          },
          child: Text('Sign In', style: setColor()),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ForgetPasswordPageView()),
            );
          },
          child: Text('Forgot Password?', style: setColor()),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Don\'t have an account?'),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignUpPageView()),
                );
              },
              child: Text('Sign Up', style: setColor()),
            ),
          ],
        ),
      ],
    );
  }

  TextStyle setColor() {
    return TextStyle(color: MyCustomColor.getColor(optionColor: style));
  }
}