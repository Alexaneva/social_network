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

  void _showShareDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Поделиться с'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Список людей'),
                SizedBox(height: 20),
                Text('Поделиться через:'),
                ListTile(
                  leading: Icon(Icons.airplay),
                  title: Text('Airdrop'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.telegram),
                  title: Text('Telegram'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text('VK'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Instagram'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text('WhatsApp'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Копировать ссылку'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Закрыть'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
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
          Container(
            width: 300,
            height: 200,
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
