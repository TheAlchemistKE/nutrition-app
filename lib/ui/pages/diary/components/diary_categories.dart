import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/dimensions.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/models/diary/diary_kind_model.dart';
import 'package:nutrinowapp/provider/account/account_provider.dart';
import 'package:nutrinowapp/service/diary/diary_category_service.dart';
import 'package:nutrinowapp/ui/pages/diary/components/diary_category_item.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';
import 'package:nutrinowapp/ui/widgets/shimmer.dart';
import 'package:provider/provider.dart';

class DiaryCategories extends StatelessWidget {
  const DiaryCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var account = Provider.of<AccountProvider>(context, listen: true);
    return Container(
      child: CustomFutureBuilder(
        source:
            DiaryCategoryService.fetchDiaryCategories(account.defaultProfile),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!(snapshot.data is List<dynamic>) ||
              !snapshot.hasData ||
              snapshot.data.length < 1) {
            return DiaryCategoriesLoader();
          }
          return gridViewItems(context, snapshot.data);
        },
        loader: DiaryCategoriesLoader(),
        errorHandler: (error) => DiaryCategoriesLoader(),
      ),
    );
  }

  Widget gridViewItems(BuildContext context, List<DiaryKindModel> diaries) {
    var size = MediaQuery.of(context).size;
    var categoryWidth = max(diaryPageCategoryItemMinWidth,
        min(diaryPageCategoryItemMaxWidth, goldenRatioSmall(size.width)));
    var categoryHeight = goldenRatioSumFromLarge(categoryWidth);

    return GridView.extent(
      childAspectRatio: (categoryWidth / categoryHeight),
      shrinkWrap: true,
      controller: ScrollController(keepScrollOffset: false),
      mainAxisSpacing: 20,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 20,
      maxCrossAxisExtent: categoryWidth,
      children: [
        for (var diary in diaries) DiaryCategoryItem(diaryModel: diary),
      ],
    );
  }
}

class DiaryCategoriesLoader extends StatelessWidget {
  final int itemCount;
  final bool isListView;

  const DiaryCategoriesLoader(
      {Key? key, this.itemCount = 4, this.isListView = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = max(diaryPageCategoryItemMinWidth,
        min(diaryPageCategoryItemMaxWidth, goldenRatioSmall(size.width)));
    var height = goldenRatioSumFromLarge(width);
    return isListView
        ? _listView(context, width, height)
        : _gridView(context, width, height);
  }

  Widget _gridView(BuildContext context, double width, double height) {
    return Shimmer(
      child: GridView.extent(
        childAspectRatio: (width / height),
        shrinkWrap: true,
        controller: ScrollController(keepScrollOffset: false),
        mainAxisSpacing: 20,
        physics: NeverScrollableScrollPhysics(),
        crossAxisSpacing: 20,
        maxCrossAxisExtent: width,
        children: [
          for (var i = 0; i < itemCount; i++) DiaryCategoryItemLoader(),
        ],
      ),
    );
  }

  Widget _listView(BuildContext context, double width, double height) {
    return Container(
      height: width,
      child: Shimmer(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: width,
              margin: EdgeInsets.only(right: 30),
              child: DiaryCategoryItemLoader(),
            );
          },
        ),
      ),
    );
  }
}
