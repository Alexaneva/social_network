import 'package:flutter/material.dart';
import 'package:social_network/src/constants/app_colors.dart';
import 'package:social_network/src/constants/app_fonts.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isObscureText;
  final Color color;
  final Color textColor;
  final Widget? suffixIcon;

  const InputField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.isObscureText,
    required this.color,
    required this.textColor,
    this.suffixIcon,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isObscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.labelText,
        hintStyle: AppFonts.headline2.copyWith(
            color: AppColors.grayScale400
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grayScale300),
        ),
        // errorText: '',
        suffixIcon: widget.suffixIcon,
      ),
      style: TextStyle(color: widget.textColor),
      onChanged: (value) {
        setState(() {});
      },
    );
  }
}
