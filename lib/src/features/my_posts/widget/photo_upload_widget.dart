import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';

class PhotoUploadWidget extends StatelessWidget {
  final VoidCallback onUpload;

  const PhotoUploadWidget({super.key, required this.onUpload});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(20),
      color: AppColors.lime250,
      strokeWidth: 2,
      dashPattern: [10, 5],
      child: Container(
        height: 150,
        width: 350,
        decoration: BoxDecoration(
          color: AppColors.grayScale200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: onUpload,
              icon: Icon(
                Icons.cloud_upload,
                size: 35,
                color: AppColors.lime250,
              ),
            ),
            Text(
              'Upload your photo here',
              style: AppFonts.body2.copyWith(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}