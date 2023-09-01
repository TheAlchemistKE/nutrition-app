import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/models/diary/diary_kind_model.dart';
import 'package:nutrinowapp/provider/account/account_provider.dart';
import 'package:nutrinowapp/service/diary/diary_category_service.dart';
import 'package:nutrinowapp/ui/pages/diary/components/diary_categories.dart';
import 'package:nutrinowapp/ui/pages/diary/components/diary_category_item.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';
import 'package:provider/provider.dart';

class RecommendationGoalGeneric extends StatelessWidget {
  final DiaryKindModel diaryModel;

  const RecommendationGoalGeneric({Key? key, required this.diaryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: DiaryCategoryItem(diaryModel: diaryModel));
  }
}

class RecommendationGoalGenericList extends StatelessWidget {
  final double height;

  const RecommendationGoalGenericList({Key? key, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardWidth = goldenRatioSmall(min(size.width, size.height));

    return Consumer<AccountProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return CustomFutureBuilder(
          source: DiaryCategoryService.fetchDiaryCategories(
            value.defaultProfile,
          ),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData || !(snapshot.data is List<dynamic>)) {
              return DiaryCategoriesLoader(isListView: true);
            }
            return Container(
              height: height,
              constraints: BoxConstraints(),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: cardWidth,
                    margin: EdgeInsets.only(right: 30),
                    child: RecommendationGoalGeneric(
                      diaryModel: snapshot.data[index],
                    ),
                  );
                },
              ),
            );
          },
          loader: DiaryCategoriesLoader(isListView: true),
          errorHandler: (error) => DiaryCategoriesLoader(isListView: true),
        );
      },
    );
  }
}
