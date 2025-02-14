import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_text_controlles.dart';
import '../../../widgets/input_field.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({super.key});

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Account info',
            style: AppFonts.headline1.copyWith(
              fontSize: 17,
              color: AppColors.grayScale700,
            ),
          ),
        ),
        SizedBox(height: 10),
        InputField(
          label: 'E-mail',
          controller: TextEditingControllers.profileEmail,
          labelText: 'Enter your e-mail',
          isHiddenText: false,
          color: AppColors.grayScale800,
          textColor: AppColors.grayScale800,
        ),
        SizedBox(height: 10),
        InputField(
          label: 'Phone number',
          labelText: 'Enter your phone number',
          isHiddenText: false,
          color: AppColors.grayScale800,
          textColor: AppColors.grayScale800,
        ),
        SizedBox(height: 10),
        InputField(
          label: 'Country',
          controller: TextEditingControllers.country,
          labelText: 'Enter your country',
          isHiddenText: false,
          color: AppColors.grayScale800,
          textColor: AppColors.grayScale800,
        ),
      ],
    );
  }
}
