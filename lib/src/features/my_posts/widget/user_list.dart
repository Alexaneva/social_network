import 'package:flutter/material.dart';

import '../../../constants/app_images.dart';
import '../../profile/model/user_model.dart';

class UserList extends StatelessWidget {
  final List<User> users;

  const UserList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
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
                Text(user.name),
              ],
            ),
          );
        },
      ),
    );
  }
}
