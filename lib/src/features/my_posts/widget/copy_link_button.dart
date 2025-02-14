import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';

class CopyLinkButton extends StatelessWidget {
  final VoidCallback onCopy;

  const CopyLinkButton({super.key, required this.onCopy});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.grayScale300,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.only(left: 16, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Copy Link',
              style: AppFonts.headline1.copyWith(
                fontSize: 17,
                color: AppColors.grayScale700,
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.file_copy_outlined, color: AppColors.grayScale700, size: 20),
              onPressed: onCopy,
            ),
          ],
        ),
      ),
    );
  }
}
