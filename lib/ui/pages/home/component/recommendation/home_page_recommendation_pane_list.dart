import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/models/profile/profile_recommendation_model.dart';
import 'package:nutrinowapp/ui/pages/home/component/recommendation/home_page_recommendation_pane_list_item.dart';
import 'package:nutrinowapp/ui/widgets/shimmer.dart';
import 'package:nutrinowapp/ui/widgets/shimmer_loading.dart';

class HomePageRecommendationPaneList extends StatelessWidget {
  final List<ProfileRecommendationModel> recommendations;

  const HomePageRecommendationPaneList(
      {Key? key, required this.recommendations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardWidth = min(size.width - 50, min(size.height, 650.0));
    var cardHeight = goldenRatioLarge(cardWidth);

    return Container(
      height: cardHeight,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return Container(width: 40);
        },
        itemCount: recommendations.length,
        itemBuilder: (BuildContext context, int index) {
          return HomePageRecommendationPaneListItem(
            recommendationModel: recommendations[index].recommendation,
            cardWidth: cardWidth,
          );
        },
      ),
    );
  }
}

class HomePageRecommendationPaneListLoader extends StatelessWidget {
  final int itemCount;

  const HomePageRecommendationPaneListLoader({Key? key, this.itemCount = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardWidth = min(size.width - 50, min(size.height, 650.0));
    var cardHeight = goldenRatioLarge(cardWidth);

    return Shimmer(
      child: Container(
        height: cardHeight,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) =>
              Container(width: 40),
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            return ShimmerLoading(
              isLoading: true,
              child: HomePageRecommendationPaneListItemLoader(
                cardWidth: cardWidth,
              ),
            );
          },
        ),
      ),
    );
  }
}
