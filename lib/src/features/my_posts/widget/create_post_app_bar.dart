import 'package:flutter/material.dart';

import '../../../constants/app_fonts.dart';

class CreatePostCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CreatePostCustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style:
            AppFonts.title3.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
