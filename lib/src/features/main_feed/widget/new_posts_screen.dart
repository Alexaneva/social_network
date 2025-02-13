import 'package:flutter/material.dart';

import '../../../constants/app_images.dart';
import '../../../widgets/post_feed.dart';
import '../../profile/model/user_model.dart';

class NewPostsScreen extends StatelessWidget {
  const NewPostsScreen({super.key});

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
