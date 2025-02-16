import 'package:flutter/material.dart';
import 'package:social_network/src/constants/app_images.dart';

import '../../../constants/app_colors.dart';
import 'show_photo_dialog.dart';

class AvatarProfile extends StatefulWidget {
  const AvatarProfile({super.key});

  @override
  State<AvatarProfile> createState() => _AvatarProfileState();
}

class _AvatarProfileState extends State<AvatarProfile> {
  @override
  Widget build(BuildContext context) {
    return Center(
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
                  child: Icon(
                    Icons.photo_camera,
                    color: AppColors.grayScale0,
                    size: 18,
                  )),
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ShowPhotoDialog();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
