import 'package:flutter/material.dart';
import 'package:social_network/src/constants/app_colors.dart';
import 'package:social_network/src/constants/app_fonts.dart';

import '../features/auth/domain/validation/auth_validation.dart';

class InputField extends StatefulWidget {
  final String labelText;
  final Color color;
  final Color textColor;
  final String label;
  final AuthValidator? validator;
  final bool? isHiddenText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Function()? onTap;
  final String? errorText;

  const InputField({
    super.key,
    required this.labelText,
    required this.color,
    required this.textColor,
    required this.label,
    this.validator,
    this.isHiddenText,
    this.controller,
    this.suffixIcon,
    this.onTap,
    this.errorText,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isHiddenText = true;
  String? _errorText;
  String? _passwordText;

  @override
  void initState() {
    super.initState();
    _isHiddenText = widget.isHiddenText!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(widget.label,
            style: AppFonts.headline2.copyWith(
              color: AppColors.grayScale400,
            )),
      ),
      TextFormField(
        obscureText: _isHiddenText,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.labelText,
          hintStyle: AppFonts.headline2.copyWith(
            color:
                _errorText != null ? AppColors.error : AppColors.grayScale400,
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color:
                  _errorText != null ? AppColors.error : AppColors.grayScale300,
            ),
          ),
          errorText: _errorText,
          suffixIcon: widget.labelText == 'Enter your Password' ||
                  widget.labelText == 'Confirm your Password'
              ? IconButton(
                  icon: Icon(
                    _isHiddenText ? Icons.visibility_off : Icons.visibility,
                    color: _errorText != null
                        ? AppColors.error
                        : AppColors.grayScale400,
                  ),
                  onPressed: () {
                    setState(() {
                      _isHiddenText = !_isHiddenText;
                    });
                  },
                )
              : null,
        ),
        style: TextStyle(
          color: _errorText != null ? AppColors.error : widget.textColor,
        ),
        onChanged: (value) {
          if (widget.labelText == 'Enter your e-mail') {
            _errorText = widget.validator?.validateEmail(value);
          } else if (widget.labelText == 'Enter your Password') {
            _errorText = widget.validator?.validatePassword(value);
            _passwordText = value;
          } else if (widget.labelText == 'Confirm your Password') {
            if (_passwordText != null) {
              _errorText = widget.validator
                  ?.validateConfirmPassword(_passwordText!, value);
            }
          } else {
            _errorText = null;
          }
          setState(() {});
        },
        onTap: widget.onTap,
      ),
    ]);
  }
}
