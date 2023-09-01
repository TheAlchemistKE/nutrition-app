import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/fonts.dart';

typedef NutrientCategoryTabBarOnTap = Function(int index);

class NutrientCategoryTabBar extends StatelessWidget {
  final NutrientCategoryTabBarOnTap onTap;
  final TabController controller;
  final List<String> tabs;

  const NutrientCategoryTabBar(
      {Key? key,
      required this.onTap,
      required this.controller,
      required this.tabs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      controller: controller,
      tabs: tabs.map((e) => Tab(text: e)).toList(),
      unselectedLabelStyle: opensSans(
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      indicatorColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Colors.black,
      labelStyle: opensSans(
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
      isScrollable: true,
    );
  }
}
