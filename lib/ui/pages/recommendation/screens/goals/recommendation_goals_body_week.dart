import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/ui/pages/recommendation/components/recommendation_goal_generic.dart';
import 'package:nutrinowapp/ui/pages/recommendation/components/recommendation_goal_nutrient.dart';

class RecommendationGoalsBodyWeek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var goldenLargeSize = goldenRatioLarge(min(size.width, size.height)) * 0.84;

    return Container(
      padding: EdgeInsets.only(top: 30),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          RecommendationGoalGenericList(height: goldenLargeSize),
          SizedBox(height: 30),
          Text(
            'Today',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: cl2D786E,
                ),
          ),
          SizedBox(height: 20),
          RecommendationGoalNutrientList(),
        ],
      ),
    );
  }
}
