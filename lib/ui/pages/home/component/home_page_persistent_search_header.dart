import 'package:flutter/material.dart';
import 'package:nutrinowapp/ui/pages/home/component/home_page_search_field.dart';

class HomePagePersistentSearchHeader extends SliverPersistentHeaderDelegate {
  HomePagePersistentSearchHeader({Key? key});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return GestureDetector(
      onTap: () => Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
        height: 56.0,
        child: Card(
          margin: EdgeInsets.all(0),
          color: Colors.white,
          elevation: 1.5,
          child: HomePageHomePageSearchField(),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 56.0;

  @override
  double get minExtent => 56.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
