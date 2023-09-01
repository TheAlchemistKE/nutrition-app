import 'package:flutter/material.dart';
import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/models/food/food_details_model.dart';
import 'package:nutrinowapp/models/food/food_search_filter_model.dart';
import 'package:nutrinowapp/ui/pages/food/components/food_result_pane.dart';
import 'package:nutrinowapp/ui/pages/food/screens/food_search/food_search_result_error.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class FoodSearchResult extends StatefulWidget {
  final FoodSearchFilterModel filter;

  const FoodSearchResult(this.filter, {Key? key}) : super(key: key);

  @override
  _FoodSearchResultState createState() => _FoodSearchResultState();
}

class _FoodSearchResultState extends State<FoodSearchResult> {
  late Future<dynamic> _futureNutrientCategoryFood;

  @override
  void initState() {
    super.initState();
    _futureNutrientCategoryFood =
        Api.api().get('/food', query: widget.filter.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: CustomFutureBuilder(
          source: _futureNutrientCategoryFood,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!(snapshot.data is List<dynamic>) ||
                !snapshot.hasData ||
                (snapshot.data as List<dynamic>).isEmpty) {
              return FoodSearchResultErrorNotFound();
            }

            var food = <FoodDetailsModel>[];
            snapshot.data
                .forEach((i) => food.add(FoodDetailsModel.fromJson(i)));

            return FoodResultPane(food);
          },
          loader: circularProgress,
          errorHandler: (error) => FutureBuilderErrorDisplay('$error'),
        ),
      ),
    );
  }
}
