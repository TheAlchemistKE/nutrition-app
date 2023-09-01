import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/constants/dimensions.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/models/food/food_category_model.dart';
import 'package:nutrinowapp/ui/pages/food/components/food_page_category.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class FoodPageCategoryPane extends StatefulWidget {
  const FoodPageCategoryPane({Key? key}) : super(key: key);

  @override
  _FoodPageCategoryPaneState createState() => _FoodPageCategoryPaneState();
}

class _FoodPageCategoryPaneState extends State<FoodPageCategoryPane> {
  late Future<dynamic> _futureCategories;

  @override
  void initState() {
    super.initState();
    setFutureCategory();
  }

  void setFutureCategory() =>
      _futureCategories = Api.api().get('/food-category');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomFutureBuilder(
        source: _futureCategories,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!(snapshot.data is List<dynamic>) ||
              !snapshot.hasData ||
              snapshot.data.length < 1) {
            return Container();
          }

          var foodCategories = <FoodCategoryModel>[];
          snapshot.data.forEach(
              (i) => foodCategories.add(FoodCategoryModel.fromJson(i)));

          return FoodScreenCategories(foodCategories);
        },
        loader: circularProgress,
        errorHandler: (error) => FutureBuilderErrorDisplay('$error'),
      ),
    );
  }
}

class FoodScreenCategories extends StatelessWidget {
  final List<FoodCategoryModel> categories;

  const FoodScreenCategories(this.categories, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var categorySize =
        max(foodScreenCategoryItemWidth, goldenRatioSmall(size.width));

    return Container(
      child: GridView.extent(
        shrinkWrap: true,
        controller: ScrollController(keepScrollOffset: false),
        mainAxisSpacing: 10,
        physics: BouncingScrollPhysics(),
        crossAxisSpacing: 10,
        maxCrossAxisExtent: categorySize,
        children: [
          for (var category in categories) FoodPageCategory(category),
        ],
      ),
    );
  }
}
