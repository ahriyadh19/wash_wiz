import 'package:flutter/material.dart';

class InputDesign extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController controller;
  final Icon prefixIcon;

  const InputDesign({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.obscureText,
    required this.controller,
    required this.prefixIcon,
  });

  @override
  State<InputDesign> createState() => _InputDesignState();
}

class _InputDesignState extends State<InputDesign> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        TextField(
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText && !_showPassword,
          controller: widget.controller,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            hintStyle: const TextStyle(color: Colors.grey),
            hintText: widget.hintText,
            suffixIcon: widget.obscureText == true
                ? IconButton(
                    icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  )
                : null,
            border: const UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(color: Colors.blueAccent),
            ),
          ),
        ),
      ],
    );
  }
}
