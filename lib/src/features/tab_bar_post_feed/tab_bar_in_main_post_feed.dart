import 'package:flutter/material.dart';
import 'package:social_network/src/constants/app_colors.dart';
import 'package:social_network/src/constants/app_fonts.dart';

class TabBarWidget extends StatefulWidget {
  final TabController tabController;
  final Function(int) onTap;

  const TabBarWidget({
    required Key key,
    required this.tabController,
    required this.onTap,
  }) : super(key: key);

  @override
  State <TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    widget.tabController.removeListener(_onTabChanged);
    super.dispose();
  }

  void _onTabChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        int newIndex = widget.tabController.index == 0 ? 1 : 0;
        widget.onTap(newIndex);
        widget.tabController.animateTo(newIndex);
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
                    color: widget.tabController.index == 0
                        ? AppColors.lime250
                        : AppColors.grayScale200,
                  ),
                  child: Center(
                    child: Text(
                      'New',
                      style: AppFonts.body3.copyWith(
                        fontWeight: FontWeight.w700,
                        color: widget.tabController.index == 0
                            ? AppColors.grayScale0
                            : AppColors.grayScale800,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    color: widget.tabController.index == 1
                        ? AppColors.lime250
                        : AppColors.grayScale200,
                  ),
                  child: Center(
                    child: Text(
                      'Top',
                      style: AppFonts.body3.copyWith(
                        fontWeight: FontWeight.w700,
                        color: widget.tabController.index == 1
                            ? AppColors.grayScale0
                            : AppColors.grayScale800,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
