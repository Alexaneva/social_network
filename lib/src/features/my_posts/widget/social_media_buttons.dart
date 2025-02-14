import 'package:flutter/material.dart';


class SocialMediaButtons extends StatelessWidget {
  final List<String> images;

  const SocialMediaButtons({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: images.map((image) {
              return IconButton(
                icon: Image.asset(image),
                onPressed: () {},
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
