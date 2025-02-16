import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_text_controlles.dart';
import 'personal_info.dart';

class AppBarProfileScreen extends StatefulWidget
    implements PreferredSizeWidget {
  const AppBarProfileScreen({super.key});

  @override
  State<AppBarProfileScreen> createState() => _AppBarProfileScreenState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _AppBarProfileScreenState extends State<AppBarProfileScreen> {
  final GlobalKey<_AppBarProfileScreenState> _appBarProfileScreenKey =
      GlobalKey<_AppBarProfileScreenState>();

  bool isMale = true;
  bool isFemale = false;

  void saveInformation() async {
    final prefs = await SharedPreferences.getInstance();
    final personalInfoValues = PersonalInfo.getValues(context);

    prefs.setString('firstName', TextEditingControllers.firstName.text);
    prefs.setString('lastName', TextEditingControllers.lastName.text);
    prefs.setString('sureName', TextEditingControllers.sureName.text);
    prefs.setString('email', TextEditingControllers.profileEmail.text);
    prefs.setString('phoneNumber', TextEditingControllers.phoneNumber.text);
    prefs.setString('country', TextEditingControllers.country.text);
    prefs.setString('bDay', TextEditingControllers.bDay.text);
    prefs.setBool('isMale', personalInfoValues['isMale']);
    prefs.setBool('isFemale', personalInfoValues['isFemale']);
    prefs.setString('bDay', personalInfoValues['selectedDate'].toString());
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        onPressed: () {},
      ),
      actions: [
        TextButton(
            onPressed: () {
              _appBarProfileScreenKey.currentState?.saveInformation();
            },
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
    );
  }

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
