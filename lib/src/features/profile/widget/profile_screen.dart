import 'package:flutter/material.dart';
import 'account_info.dart';
import 'app_bar_profile_screen.dart';
import 'avatar_profile.dart';
import 'personal_info.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarProfileScreen(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              AvatarProfile(),
              SizedBox(height: 15),
              PersonalInfo(),
              SizedBox(height: 30),
              AccountInfo(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
