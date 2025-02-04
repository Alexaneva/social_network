import 'package:flutter/material.dart';

import '../../common_widgets/post_feed.dart';
import '../../constants/app_images.dart';
import '../user/user_model.dart';

class NewPosts extends StatelessWidget {
  const NewPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return PostFeed(
        user: User(
      name: 'Sam Smith',
      photoUrl: AppImages.ava,
    ));
  }
}
