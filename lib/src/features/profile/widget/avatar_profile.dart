import 'package:flutter/material.dart';
import 'package:social_network/src/constants/app_images.dart';

import '../../../constants/app_colors.dart';

class AvatarProfile extends StatelessWidget {
  const AvatarProfile({super.key});

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
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
