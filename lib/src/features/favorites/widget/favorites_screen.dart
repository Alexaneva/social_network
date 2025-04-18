import 'package:flutter/material.dart';

import '../../../constants/app_fonts.dart';
import '../../../constants/app_images.dart';
import '../../../routing/app_routes.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 20, left: 10, right: 10),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.oops),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
