import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_category_model.dart';
import 'package:nutrinowapp/ui/pages/home/component/nutrient/home_page_nutrient_intake_pane_list_item.dart';
import 'package:nutrinowapp/ui/widgets/shimmer.dart';
import 'package:nutrinowapp/ui/widgets/shimmer_loading.dart';

class RecommendedIntakePaneList extends StatelessWidget {
  final List<NutrientCategoryModel> nutrientCategories;

  const RecommendedIntakePaneList({Key? key, required this.nutrientCategories})
      : super(key: key);

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
        separatorBuilder: (BuildContext context, int index) =>
            Container(width: 25),
        itemCount: nutrientCategories.length,
        itemBuilder: (BuildContext context, int index) {
          return RecommendedIntakePaneListItem(
            nutrientCategory: nutrientCategories[index],
            cardWidth: cardWidth,
          );
        },
      ),
    );
  }
}

class RecommendedIntakePaneListLoader extends StatelessWidget {
  final int itemCount;

  const RecommendedIntakePaneListLoader({Key? key, this.itemCount = 5})
      : super(key: key);

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
          separatorBuilder: (BuildContext context, int index) =>
              Container(width: 25),
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            return ShimmerLoading(
              isLoading: true,
              child: RecommendedIntakePaneListItemLoader(
                cardWidth: cardWidth,
              ),
            );
          },
        ),
      ),
    );
  }
}
