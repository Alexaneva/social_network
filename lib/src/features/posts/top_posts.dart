import 'package:flutter/material.dart';

import '../../common_widgets/post_feed.dart';
import '../../constants/app_images.dart';
import '../user/user_model.dart';

class TopPosts extends StatelessWidget {
  const TopPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return PostFeed(
              user: User(
                name: 'Joe R.',
                photoUrl: AppImages.ava,
              ));
        });
  }
}
