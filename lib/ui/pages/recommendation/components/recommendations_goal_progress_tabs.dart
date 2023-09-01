import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';

TabBar recommendationGoalProgressTabs(BuildContext context, double tabWidth) {
  return TabBar(
    labelPadding: EdgeInsets.zero,
    indicatorColor: Colors.white,
    labelStyle: Theme.of(context).textTheme.headline6!.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
    unselectedLabelStyle: Theme.of(context).textTheme.headline6!.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
    labelColor: cl2D786E,
    unselectedLabelColor: Colors.grey.shade400,
    isScrollable: false,
    tabs: [
      Container(
        width: tabWidth,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.zero,
        color: Colors.white,
        child: Tab(text: 'Week'),
      ),
      Container(
        width: tabWidth,
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        color: Colors.white,
        child: Tab(text: 'Month'),
      ),
      Container(
        width: tabWidth,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.zero,
        color: Colors.white,
        child: Tab(text: 'Year'),
      ),
    ],
  );
}
