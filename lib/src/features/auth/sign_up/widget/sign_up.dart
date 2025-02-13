import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../constants/app_text_controlles.dart';
import '../../../../routing/app_routes.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/input_field.dart';
import '../../domain/bloc/auth_bloc.dart';
import '../../domain/bloc/auth_event.dart';
import '../../domain/bloc/auth_state.dart';
import '../../domain/validation/auth_validation.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayScale0,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.state == AuthStatus.loaded) {
            Navigator.of(context).pushReplacementNamed(Routes.main);
          } else if (state.state == AuthStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message ?? 'Sign up failed')),
            );
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 190),
                Text('Join us',
                    style: AppFonts.title3.copyWith(color: AppColors.lime250)),
                SizedBox(height: 8),
                Text('You will be able to fully communicate',
                    style: AppFonts.headline2.copyWith(
                      fontWeight: FontWeight.w600
                    )),
                SizedBox(height: 40),
                InputField(
                  label: 'E-mail',
                  controller: TextEditingControllers.signUpEmail,
                  labelText: 'Enter your e-mail',
                  isHiddenText: false,
                  color: AppColors.grayScale800,
                  textColor: AppColors.grayScale800,
                  validator: AuthValidator(),
                ),
                SizedBox(height: 20),
                InputField(
                  label: 'Password',
                  controller: TextEditingControllers.signUpPassword,
                  labelText: 'Enter your Password',
                  isHiddenText: true,
                  color: AppColors.grayScale800,
                  textColor: AppColors.grayScale800,
                  suffixIcon:
                  Icon(Icons.visibility, color: AppColors.grayScale400),
                  validator: AuthValidator(),
                ),
                SizedBox(height: 20),
                InputField(
                  label: 'Confirm password',
                  controller: TextEditingControllers.signUpConfirmPassword,
                  labelText: 'Confirm your Password',
                  isHiddenText: true,
                  color: AppColors.grayScale800,
                  textColor: AppColors.grayScale800,
                  suffixIcon:
                  Icon(Icons.visibility, color: AppColors.grayScale400),
                  validator: AuthValidator(),
                ),
                SizedBox(height: 130),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?', style: AppFonts.body2.copyWith(
                      fontSize: 15,
                    )),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(Routes.signIn);
                      },
                      child: Text(
                        'Log in',
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
                    context.read<AuthBloc>().add(SignUp(
                      TextEditingControllers.signUpEmail.text,
                      TextEditingControllers.signUpPassword.text,
                      TextEditingControllers.signUpConfirmPassword.text,
                    ));
                  },
                  color: AppColors.grayScale500,
                  backgroundColor:AppColors.grayScale200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
