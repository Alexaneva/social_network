import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
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
      ],
    );
  }
}
