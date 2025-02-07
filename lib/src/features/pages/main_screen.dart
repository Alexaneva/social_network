import 'package:flutter/material.dart';
import 'package:social_network/src/constants/app_colors.dart';
import 'package:social_network/src/features/pages/favorites_screen.dart';
import '../../constants/app_fonts.dart';
import '../../constants/app_images.dart';
import '../../routing/app_routes.dart';
import '../user/user_model.dart';
import 'main_feed_screen.dart';
import 'my_posts_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final User user = User();
  int currentIndex = 0;
  late List<Widget> body;

  @override
  void initState() {
    super.initState();
    body = [
      MainFeed(key: UniqueKey()),
      const FavoritesScreen(),
      const MyPostsScreen(),
    ];
  }

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
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (int newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: currentIndex == 0
                    ? AppColors.lime250
                    : AppColors.grayScale400,
              ),
              label: 'Main',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark,
                color: currentIndex == 1
                    ? AppColors.lime250
                    : AppColors.grayScale400,
              ),
              label: 'Favorites',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.image,
                color: currentIndex == 2
                    ? AppColors.lime250
                    : AppColors.grayScale400,
              ),
              label: 'My posts',
              backgroundColor: Colors.white,
            ),
          ]),
      body: body[currentIndex],
    );
  }
}
