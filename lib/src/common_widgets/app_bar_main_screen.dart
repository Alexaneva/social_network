import 'package:flutter/material.dart';

import '../constants/app_fonts.dart';
import '../constants/app_images.dart';

class AppBarMainScreen extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;

  const AppBarMainScreen({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        currentIndex == 0
            ? 'Hello Guest'
            : currentIndex == 1
            ? 'Favorites'
            : 'My posts',
        style: AppFonts.title3.copyWith(fontWeight: FontWeight.w800),
      ),
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage(AppImages.ava),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}