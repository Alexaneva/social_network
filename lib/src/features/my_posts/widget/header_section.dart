import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_images.dart';

class HeaderSection extends StatelessWidget {
  final String title;
  final VoidCallback onClose;

  const HeaderSection({super.key, required this.title, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          SizedBox(width: 15),
          Image.asset(AppImages.breath),
          Text(
            title,
            style: AppFonts.headline1.copyWith(
              fontSize: 17,
              color: AppColors.grayScale700,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: onClose,
            icon: CircleAvatar(
              radius: 10,
              backgroundColor: AppColors.grayScale300,
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
