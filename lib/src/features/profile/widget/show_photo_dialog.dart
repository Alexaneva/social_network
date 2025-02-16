import 'package:flutter/material.dart';
import 'package:social_network/src/features/profile/widget/photo_actions.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';

class ShowPhotoDialog extends StatefulWidget {
  const ShowPhotoDialog({super.key});

  @override
  State<ShowPhotoDialog> createState() => _ShowPhotoDialogState();
}

class _ShowPhotoDialogState extends State<ShowPhotoDialog> {
  final PhotoActions photoActions = PhotoActions();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            width: 200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  child: Text('Take a photo',
                      style: AppFonts.headline1
                          .copyWith(fontSize: 15, color: AppColors.lime250)),
                  onPressed: () {},
                ),
                Divider(),
                TextButton(
                  child: Text('Choose from the library',
                      style: AppFonts.headline1
                          .copyWith(fontSize: 15, color: AppColors.lime250)),
                  onPressed: () => photoActions.chooseFromLibrary(context),
                ),
                Divider(),
                TextButton(
                  child: Text('Delete photo',
                      style: AppFonts.headline1
                          .copyWith(fontSize: 15, color: AppColors.error)),
                  onPressed: () => photoActions.deletePhoto(context),
                ),
              ],
            ),
          ),
        ),
        AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            width: 200,
            child: TextButton(
              child: Text('Cancel',
                  style: AppFonts.headline1
                      .copyWith(fontSize: 15, color: AppColors.lime250)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
