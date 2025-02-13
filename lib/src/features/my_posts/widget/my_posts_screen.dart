import 'package:flutter/material.dart';
import 'package:social_network/src/constants/app_colors.dart';

import '../../../constants/app_images.dart';
import '../../../widgets/post_feed.dart';
import '../../profile/model/user_model.dart';
import 'create_my_post_screen.dart';

class MyPostsScreen extends StatefulWidget {
  const MyPostsScreen({super.key});

  @override
  State<MyPostsScreen> createState() => _MyPostsScreenState();
}

class _MyPostsScreenState extends State<MyPostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return PostFeed(
                user: User(
              name: 'Joe R.',
              photoUrl: AppImages.ava,
            ));
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.lime250,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          Icons.add,
          color: AppColors.grayScale0,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateMyPostScreen()),
          );
        },
      ),
    );
  }
}
