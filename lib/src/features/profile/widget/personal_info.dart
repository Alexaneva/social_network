import 'package:flutter/material.dart';
import 'package:social_network/src/features/profile/widget/show_pick_data_birth_dialog_screen.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_text_controlles.dart';
import '../../../widgets/input_field.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    bool isMale = true;
    bool isFemale = false;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Personal Info',
            style: AppFonts.headline1.copyWith(
              fontSize: 17,
              color: AppColors.grayScale700,
            ),
          ),
        ),
        SizedBox(height: 15),
        InputField(
          label: 'First name',
          controller: TextEditingControllers.firstName,
          labelText: 'Enter your first name',
          isHiddenText: false,
          color: AppColors.grayScale800,
          textColor: AppColors.grayScale800,
        ),
        SizedBox(height: 10),
        InputField(
          label: 'Last name',
          controller: TextEditingControllers.lastName,
          labelText: 'Enter your last name',
          isHiddenText: false,
          color: AppColors.grayScale800,
          textColor: AppColors.grayScale800,
        ),
        SizedBox(height: 10),
        InputField(
          label: 'Sure name',
          controller: TextEditingControllers.sureName,
          labelText: 'Enter your sure name',
          isHiddenText: false,
          color: AppColors.grayScale800,
          textColor: AppColors.grayScale800,
        ),
        SizedBox(height: 30),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Gender',
            style: AppFonts.headline1.copyWith(
              fontSize: 17,
              color: AppColors.grayScale700,
            ),
          ),
        ),
        SizedBox(height: 5),
        Column(
          children: [
            Row(
              children: [
                Checkbox(
                  shape: CircleBorder(),
                  checkColor: AppColors.grayScale800,
                  activeColor: AppColors.grayScale0,
                  value: isMale,
                  onChanged: (bool? value) {
                    setState(() {
                      isMale = value!;
                      isFemale = !isMale;
                    });
                  },
                ),
                Text('Male',
                    style: AppFonts.headline2.copyWith(
                        color: AppColors.grayScale800,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  shape: CircleBorder(),
                  checkColor: AppColors.grayScale800,
                  activeColor: AppColors.grayScale0,
                  value: isFemale,
                  onChanged: (bool? value) {
                    setState(() {
                      isFemale = value!;
                      isMale = !isFemale;
                    });
                  },
                ),
                Text('Female',
                    style: AppFonts.headline2.copyWith(
                        color: AppColors.grayScale800,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        SizedBox(height: 30),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Date of birth',
            style: AppFonts.headline1.copyWith(
              fontSize: 17,
              color: AppColors.grayScale700,
            ),
          ),
        ),
        SizedBox(height: 15),
        InputField(
          label: 'B-day',
          labelText: 'Enter B-day',
          isHiddenText: false,
          color: AppColors.grayScale800,
          textColor: AppColors.grayScale800,
          onTap: () async {
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return ShowDatePickerDialog(
                  controller: TextEditingControllers.bDay,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
