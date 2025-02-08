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
  List<Widget> body = [];

  @override
  void initState() {
    super.initState();
    body = [
      MainFeed(key: UniqueKey()),
      ...[
        const FavoritesScreen(),
        const MyPostsScreen(),
      ],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentIndex == 0
              ? 'Hello Guest'
              : currentIndex == 1
              ? 'Favorites'
              : 'My posts',
            style: AppFonts.title3.copyWith(fontWeight: FontWeight.w800)),
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
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 55),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(AppImages.ava),
            ),
            SizedBox(height: 16),
            Text(user.name, style: AppFonts.body2),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile',style: AppFonts.body2),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(Routes.profile);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit', style: AppFonts.body2),
              onTap: () {},
            ),
            Spacer(),
            ListTile(
              leading: Icon(Icons.wb_sunny),
              title: Text('Light theme', style: AppFonts.body2),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (int newIndex) => setState(() => currentIndex = newIndex),
          items: [
            ...[
              Icons.home,
              Icons.bookmark,
              Icons.image,
            ].asMap().entries.map((entry) {
              return BottomNavigationBarItem(
                icon: Icon(
                  entry.value,
                  color: currentIndex == entry.key
                      ? AppColors.lime250
                      : AppColors.grayScale400,
                ),
                label: ['Main', 'Favorites', 'My posts'][entry.key],
              );
            }),
          ]),
      body: body[currentIndex],
    );
  }
}
