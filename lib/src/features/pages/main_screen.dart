import 'package:flutter/material.dart';
import '../../constants/app_fonts.dart';
import '../../constants/app_images.dart';
import '../../routing/app_routes.dart';
import '../tab_bar_posts/tab_bar_post.dart';
import '../user/user_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final User user = User();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello ${user.name}!',
            style: AppFonts.title3.copyWith(fontWeight: FontWeight.w800)),
      actions: [
        IconButton(
          icon: CircleAvatar(
            backgroundImage: AssetImage(AppImages.ava),
          ), 
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Routes.profile);
          },
        ),
      ],
      ),
      body: TabScreen(),
    );
  }
}
