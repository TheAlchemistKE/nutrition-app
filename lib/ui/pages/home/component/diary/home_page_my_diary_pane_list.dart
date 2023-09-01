import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/ui/pages/home/component/diary/home_page_my_diary_pane_list_item.dart';
import 'package:nutrinowapp/ui/widgets/shimmer.dart';

class HomePageMyDiaryPaneList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardWidth = min(size.width * 0.7, 650.0);
    var cardHeight = goldenRatioLarge(cardWidth);

    return Container(
      height: cardHeight,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return Container(width: 25);
        },
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return MyDiaryPaneListItem(
            cardHeight: cardHeight,
            cardWidth: cardWidth,
          );
        },
      ),
    );
  }
}

class HomePageMyDiaryPaneListLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardWidth = min(size.width * 0.7, 650.0);
    var cardHeight = goldenRatioLarge(cardWidth);

    return Shimmer(
      child: Container(
        height: cardHeight,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) {
            return Container(width: 25);
          },
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return MyDiaryPaneListItemLoader();
          },
        ),
      ),
    );
  }
}
