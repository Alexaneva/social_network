import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_network/src/constants/app_fonts.dart';

import '../../common_widgets/input_field.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';
import '../../constants/app_text_controlles.dart';
import '../show_dialogs/show_pick_data_birth_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isMale = true;
  bool _isFemale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: AppFonts.headline1.copyWith(
            fontSize: 20,
            color: AppColors.grayScale700,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.grayScale700,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Done',
                style: AppFonts.headline1.copyWith(
                  fontSize: 17,
                  color: AppColors.lime250,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.lime250,
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(AppImages.ava),
                    ),
                    Positioned(
                      bottom: -10,
                      right: -10,
                      child: IconButton(
                        icon: CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.lime250,
                            child: Icon(Icons.photo_camera, color:AppColors.grayScale0, size: 18,)),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
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
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('First name',
                    style:
                        AppFonts.headline2.copyWith(color: AppColors.grayScale400)),
              ),
              SizedBox(height: 5),
              InputField(
                controller: TextEditingControllers.firstName,
                labelText: 'Enter your first name',
                isHiddenText: false,
                color: AppColors.grayScale800,
                textColor: AppColors.grayScale800,
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Last name',
                    style: AppFonts.headline2.copyWith(
                      color: AppColors.grayScale400,
                    )),
              ),
              SizedBox(height: 5),
              InputField(
                controller: TextEditingControllers.lastName,
                labelText: 'Enter your last name',
                isHiddenText: false,
                color: AppColors.grayScale800,
                textColor: AppColors.grayScale800,
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Sure name',
                    style: AppFonts.headline2.copyWith(
                      color: AppColors.grayScale400,
                    )),
              ),
              SizedBox(height: 5),
              InputField(
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
                        value: _isMale,
                        onChanged: (bool? value) {
                          setState(() {
                            _isMale = value!;
                            _isFemale = !_isMale;
                          });
                        },
                      ),
                      Text('Male', style: AppFonts.headline2.copyWith(
                        color: AppColors.grayScale800,fontWeight: FontWeight.bold
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        shape: CircleBorder(),
                        checkColor: AppColors.grayScale800,
                        activeColor: AppColors.grayScale0,
                        value: _isFemale,
                        onChanged: (bool? value) {
                          setState(() {
                            _isFemale = value!;
                            _isMale = !_isFemale;
                          });
                        },
                      ),
                      Text('Female', style: AppFonts.headline2.copyWith(
                          color: AppColors.grayScale800,fontWeight: FontWeight.bold
                      )),
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
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'B-day',
                    style: AppFonts.headline2.copyWith(
                      color: AppColors.grayScale400,
                    )
                ),
              ),
              InputField(
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
              SizedBox(height: 30),
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
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('E-mail',
                    style:
                        AppFonts.headline2.copyWith(color: AppColors.grayScale400)),
              ),
              SizedBox(height: 5),




              InputField(
                controller: TextEditingControllers.profileEmail,
                labelText: 'Enter your e-mail',
                isHiddenText: false,
                color: AppColors.grayScale800,
                textColor: AppColors.grayScale800,
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Phone number',
                    style:
                        AppFonts.headline2.copyWith(color: AppColors.grayScale400)),
              ),
              SizedBox(height: 5),
              InputField(
                labelText: 'Enter your phone number',
                isHiddenText: false,
                color: AppColors.grayScale800,
                textColor: AppColors.grayScale800,
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Country',
                    style:
                        AppFonts.headline2.copyWith(color: AppColors.grayScale400)),
              ),
              SizedBox(height: 5),
              InputField(
                controller: TextEditingControllers.country,
                labelText: 'Enter your country',
                isHiddenText: false,
                color: AppColors.grayScale800,
                textColor: AppColors.grayScale800,
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
