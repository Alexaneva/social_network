import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_network/src/features/user/user_model.dart';

import '../constants/app_images.dart';

class PostFeed extends StatefulWidget {
  final User user;

  const PostFeed({super.key, required this.user});

  @override
  State<PostFeed> createState() => _PostFeedState();
}

class _PostFeedState extends State<PostFeed> {
  int _likesCount = 0;

  void _incrementLikes() {
    setState(() {
      _likesCount++;
    });
  }
  final User user = User();

  void _showShareDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 400,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Breath of time'),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.close, color: Colors.white),
                  ),
                ],
              ),
              Divider(),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(AppImages.ava),
              ),
              Text(user.name),
              Divider(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ListTile(
                      leading: Icon(Icons.airplay),
                      title: Text('AirDrop'),
                    ),
                    ListTile(
                      leading: Icon(Icons.telegram),
                      title: Text('Telegram'),
                    ),
                    ListTile(
                      leading: Icon(Icons.share),
                      title: Text('VK'),
                    ),
                    ListTile(
                      leading: Icon(Icons.share),
                      title: Text('Instagram'),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Copy Link'),
                    Icon(Icons.content_copy),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String currentDate = DateFormat('dd.MM.yy').format(DateTime.now());
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Friendship',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(currentDate),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 350,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                AppImages.friends,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(AppImages.ava),
                ),
                SizedBox(width: 10),
                Text(widget.user.name,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 156),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.favorite,
                                color: _likesCount > 0 ? Colors.red : Colors.grey),
                            onPressed: _incrementLikes,
                          ),
                          Text('$_likesCount'),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: _showShareDialog,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
