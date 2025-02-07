import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class TextEditingControllers {
  static final signInEmail = TextEditingController();
  static final signInPassword = TextEditingController();
  static final signUpName = TextEditingController();
  static final signUpEmail = TextEditingController();
  static final signUpPassword = TextEditingController();
  static final signUpConfirmPassword = TextEditingController();
  static final postTitle = TextEditingController();
  static final postBody = TextEditingController();

  static bool get isSignInFormFilled {
    return signInEmail.text.isNotEmpty && signInPassword.text.isNotEmpty;
  }

  static bool get isSignUpFormFilled {
    return signUpName.text.isNotEmpty &&
        signUpEmail.text.isNotEmpty &&
        signUpPassword.text.isNotEmpty &&
        signUpConfirmPassword.text.isNotEmpty;
  }
}
