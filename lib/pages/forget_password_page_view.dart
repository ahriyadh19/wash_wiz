import 'package:flutter/material.dart';
import 'package:wash_wiz/main.dart';
import 'package:wash_wiz/widgets/bg.dart';
import 'package:wash_wiz/widgets/colors.dart';
import 'package:wash_wiz/widgets/input_design.dart';

class ForgetPasswordPageView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final int style = MyApp.style;
  ForgetPasswordPageView({super.key});

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
                children: [
                  buildForgetPasswordForm(context: context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column buildForgetPasswordForm({required BuildContext context}) {
    return Column(
      children: [
        const Text(
          'Forget Password',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Enter your email address and we will send you a link to reset your password.',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        InputDesign(
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
          obscureText: false,
          controller: emailController,
          prefixIcon: const Icon(Icons.email_rounded),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.08),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            'Submit',
            style: setColor(),
          ),
        ),
      ],
    );
  }

  TextStyle setColor() {
    return TextStyle(color: MyCustomColor.getColor(optionColor: style));
  }
}
