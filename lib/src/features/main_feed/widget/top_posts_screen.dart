import 'package:flutter/material.dart';

import '../../../constants/app_images.dart';
import '../../../widgets/post_feed.dart';
import '../../profile/model/user_model.dart';

class TopPostsScreen extends StatelessWidget {
  const TopPostsScreen({super.key});

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
