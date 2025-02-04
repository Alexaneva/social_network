import 'package:flutter/material.dart';
import 'package:social_network/src/constants/app_colors.dart';
import 'package:social_network/src/constants/app_fonts.dart';

import '../posts/new_posts.dart';
import '../posts/top_posts.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            _onTabTapped(_selectedIndex == 0 ? 1 : 0);
            _tabController.animateTo(_selectedIndex == 0 ? 1 : 0);
          },
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey[300],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        color: _selectedIndex == 0
                            ? AppColors.lime250
                            : AppColors.grayScale200,
                      ),
                      child: Center(
                          child: Text('New',
                              style: AppFonts.body3.copyWith(
                                fontWeight: FontWeight.w700,
                                color: _selectedIndex == 0
                                    ? AppColors.grayScale0
                                    : AppColors.grayScale800,
                              ))),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                        color: _selectedIndex == 1
                            ? AppColors.lime250
                            : AppColors.grayScale200,
                      ),
                      child: Center(
                          child: Text('Top',
                              style: AppFonts.body3.copyWith(
                                fontWeight: FontWeight.w700,
                                color: _selectedIndex == 1
                                    ? AppColors.grayScale0
                                    : AppColors.grayScale800,
                              ))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              NewPosts(),
              TopPosts(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
