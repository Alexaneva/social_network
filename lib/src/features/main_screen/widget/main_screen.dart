import 'package:flutter/material.dart';
import 'package:social_network/src/constants/app_colors.dart';
import 'package:social_network/src/features/favorites/widget/favorites_screen.dart';
import '../../main_feed/widget/main_feed_screen.dart';
import '../../profile/model/user_model.dart';
import 'app_bar_main_screen.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_images.dart';
import '../../../routing/app_routes.dart';
import '../../my_posts/widget/my_posts_screen.dart';
import 'custom_bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final User user = User();
  int currentIndex = 0;
  List<Widget> body = [];
  bool _isDarkTheme = false;

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
    return Theme(
      data: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBarMainScreen(currentIndex: currentIndex),
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
                title: Text('Profile', style: AppFonts.body2),
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
                title: Text(_isDarkTheme ? 'Light theme' : 'Dark theme',
                    style: AppFonts.body2),
                onTap: () {
                  setState(() {
                    _isDarkTheme = !_isDarkTheme;
                  });
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (int newIndex) {
              setState(() {
                currentIndex = newIndex;
              });
            }),
        body: body[currentIndex],
      ),
    );
  }
}
