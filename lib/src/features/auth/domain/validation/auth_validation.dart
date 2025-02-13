class AuthValidator {
  String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email cannot be empty';
    }
    if (!email.contains('@') || !email.contains('.')) {
      return 'Enter correct email';
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.length < 5) {
      return 'Password field must be at least 5 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String password, String confirmPassword) {
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }
}
