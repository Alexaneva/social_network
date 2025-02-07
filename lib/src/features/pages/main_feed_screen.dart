import 'package:flutter/material.dart';

import '../posts/new_posts.dart';
import '../posts/top_posts.dart';
import '../tab_bar_post_feed/tab_bar_in_main_post_feed.dart';
import '../user/user_model.dart';

class MainFeed extends StatefulWidget {
  const MainFeed({ required Key key}) : super(key: key);

  @override
  State<MainFeed> createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final User user = User();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TabBarWidget(
            tabController: _tabController,
            onTap: (index) {
              setState(() {
                _tabController.index = index;
              });
            },
            key: UniqueKey(),
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
      ),
    );
  }
}
