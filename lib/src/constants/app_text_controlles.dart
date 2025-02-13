import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class TextEditingControllers {
  static final signInEmail = TextEditingController();
  static final signInPassword = TextEditingController();
  static final signUpEmail = TextEditingController();
  static final signUpPassword = TextEditingController();
  static final signUpConfirmPassword = TextEditingController();
  static final postTitle = TextEditingController();
  static final postBody = TextEditingController();
  static final firstName = TextEditingController();
  static final lastName = TextEditingController();
  static final sureName = TextEditingController();
  static final bDay = TextEditingController();
  static final profileEmail = TextEditingController();
  static final country = TextEditingController();

  static bool get isSignInFormFilled {
    return signInEmail.text.isNotEmpty && signInPassword.text.isNotEmpty;
  }

  static bool get isSignUpFormFilled {
    return
        signUpEmail.text.isNotEmpty &&
        signUpPassword.text.isNotEmpty &&
        signUpConfirmPassword.text.isNotEmpty;
  }
}
