import 'package:flutter/material.dart';
import '../constants/app_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color color;
  final EdgeInsetsGeometry padding;
  final Size minimumSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
     this.foregroundColor,
     this.backgroundColor,
    required this.color,
    this.padding = const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
    this.minimumSize = const Size(360, 60),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        padding: padding,
        minimumSize: minimumSize,
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppFonts.body2.copyWith(
          decoration: TextDecoration.none,
          color: color,
        ),
      ),
    );
  }
}
