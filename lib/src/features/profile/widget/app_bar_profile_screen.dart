import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';

class AppBarProfileScreen extends StatelessWidget
    implements PreferredSizeWidget {

  const AppBarProfileScreen({super.key});

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
            onPressed: () {},
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

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
