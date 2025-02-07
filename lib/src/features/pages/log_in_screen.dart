import 'package:flutter/material.dart';
import 'package:social_network/src/common_widgets/custom_button.dart';
import 'package:social_network/src/constants/app_colors.dart';
import 'package:social_network/src/constants/app_fonts.dart';

import '../../common_widgets/authorisation_input_field.dart';
import '../../constants/app_text_controlles.dart';
import '../../routing/app_routes.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayScale0,
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 250),
            Text('Log In',
                style: AppFonts.title3.copyWith(color: AppColors.lime250)),
            SizedBox(height: 8),
            Text('You will be able to fully communicate',
                style: AppFonts.headline2.copyWith(
                    fontWeight: FontWeight.w600
                )),
            SizedBox(height: 40),
            Text('E-mail',
                style:
                    AppFonts.headline2.copyWith(color: AppColors.grayScale400)),
            InputField(
              controller: TextEditingControllers.signInEmail,
              labelText: 'Enter your e-mail',
              isObscureText: false,
              color: AppColors.grayScale800,
              textColor: AppColors.grayScale800,
            ),
            SizedBox(height: 20),
            Text('Password',
                style: AppFonts.headline2.copyWith(
                  color: AppColors.grayScale400,
                )),
            InputField(
              controller: TextEditingControllers.signInPassword,
              labelText: 'Enter your Password',
              isObscureText: true,
              color: AppColors.grayScale800,
              textColor: AppColors.grayScale800,
              suffixIcon:
                  Icon(Icons.visibility_off, color: AppColors.grayScale400),
            ),
            SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No account?', style: AppFonts.body2.copyWith(
                  fontSize: 15,
                )),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(Routes.signUp);
                  },
                  child: Text(
                    'Register',
                    style: AppFonts.body2.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.lime100,
                      color: AppColors.lime250,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            CustomButton(
                text: 'Continue',
                onPressed: (){
                  Navigator.of(context).pushReplacementNamed(Routes.main);
                },
                color: AppColors.grayScale500,
              backgroundColor:AppColors.grayScale200,
            ),
          ],
        ),
      ),
    );
  }
}
