import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:wash_wiz/main.dart';
import 'package:wash_wiz/widgets/bg.dart';
import 'package:wash_wiz/widgets/colors.dart';
import 'package:wash_wiz/widgets/input_design.dart';

class SignUpPageView extends StatefulWidget {
  const SignUpPageView({super.key});

  @override
  State<SignUpPageView> createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<SignUpPageView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final int style = MyApp.style;
  Duration textSpeed = const Duration(milliseconds: 150);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BG(
      optionImage: style,
      child: buildSignUpForm(),
    ));
  }

  Padding buildSignUpForm() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            textMove(),
            InputDesign(
              hintText: 'Name',
              keyboardType: TextInputType.name,
              obscureText: false,
              controller: nameController,
              prefixIcon: const Icon(Icons.person),
            ),
            InputDesign(
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              controller: emailController,
              prefixIcon: const Icon(Icons.email_rounded),
            ),
            InputDesign(
              hintText: 'Password',
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              controller: passwordController,
              prefixIcon: const Icon(Icons.lock),
            ),
            InputDesign(
              hintText: 're-Password',
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              controller: rePasswordController,
              prefixIcon: const Icon(Icons.lock),
            ),
            InputDesign(
              hintText: 'Mobile',
              keyboardType: TextInputType.phone,
              obscureText: false,
              controller: mobileController,
              prefixIcon: const Icon(Icons.phone_android_rounded),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Submit',
                style: setColor(),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  TextStyle setColor() {
    return TextStyle(color: MyCustomColor.getColor(optionColor: style));
  }

  DefaultTextStyle textMove() {
    return DefaultTextStyle(
      style: TextStyle(fontSize: 25.0, color: Colors.transparent, fontWeight: FontWeight.bold, shadows: [
        Shadow(
          blurRadius: 7.0,
          color: MyCustomColor.getColor(optionColor: style),
          offset: const Offset(1, 0),
        ),
        Shadow(
          blurRadius: 1.0,
          color: MyCustomColor.getColor(optionColor: style),
          offset: const Offset(0, 1),
        ),
      ]),
      child: AnimatedTextKit(
        repeatForever: true,
        displayFullTextOnTap: true,
        isRepeatingAnimation: true,
        animatedTexts: [
          TyperAnimatedText(
            'Drive Clean, Drive Happy,',
            speed: textSpeed,
          ),
          TyperAnimatedText('Join us for a Shine that Lasts!', speed: textSpeed),
          TyperAnimatedText('At Your Doorstep!', speed: textSpeed),
          TyperAnimatedText('Wash Wiz . . .', speed: textSpeed),
        ],
      ),
    );
  }
}
