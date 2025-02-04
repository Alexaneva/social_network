import 'package:flutter/material.dart';

import '../../common_widgets/custom_button.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import '../../constants/app_images.dart';
import '../../routing/app_routes.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.onBoarding),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 65.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: AppFonts.body2.copyWith(
                      decoration: TextDecoration.none,
                      color: AppColors.grayScale0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(Routes.login);
                    },
                    child: Text(
                      'Log in',
                      style: AppFonts.body2.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.lime100,
                        color: AppColors.lime100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1),
            CustomButton(
              text: 'Create an account',
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(Routes.signUp);
              },
              color: AppColors.lime250,
              backgroundColor: AppColors.grayScale700,
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
