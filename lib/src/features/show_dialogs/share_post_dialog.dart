import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import '../../constants/app_images.dart';
import '../user/user_model.dart';

class ShareDialog extends StatelessWidget {
  final User user;

  const ShareDialog({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              SizedBox(width: 15),
              Image.asset(AppImages.breath),
              Text(
                'Breath of time',
                style: AppFonts.headline1.copyWith(
                  fontSize: 17,
                  color: AppColors.grayScale700,
                ),
              ),
              SizedBox(width: 180),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
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
        ),
        Divider(),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(AppImages.ava),
                    ),
                    SizedBox(height: 8),
                    Text(
                      user.name,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Divider(),
        SizedBox(
          height: 100,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Image.asset(AppImages.airdrop),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset(AppImages.tg),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset(AppImages.vk),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset(AppImages.inst),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset(AppImages.whats),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
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
                  icon: Icon(Icons.file_copy_outlined,
                      color: AppColors.grayScale700, size: 20),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
