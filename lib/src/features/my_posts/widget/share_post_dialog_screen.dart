import 'package:flutter/material.dart';
import 'package:social_network/src/features/my_posts/widget/social_media_buttons.dart';
import 'package:social_network/src/features/my_posts/widget/user_list.dart';

import '../../../constants/app_images.dart';
import '../../profile/model/user_model.dart';
import 'copy_link_button.dart';
import 'header_section.dart';

class ShareDialog extends StatelessWidget {
  final List<User> users;

  const ShareDialog({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderSection(
          title: 'Breath of time',
          onClose: () => Navigator.pop(context),
        ),
        Divider(),
        UserList(users: users),
        Divider(),
        SocialMediaButtons(images: [
          AppImages.airdrop,
          AppImages.tg,
          AppImages.vk,
          AppImages.inst,
          AppImages.whats,
        ]),
        SizedBox(height: 20),
        CopyLinkButton(onCopy: () {}),
      ],
    );
  }
}
