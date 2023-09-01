import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/fonts.dart';
import 'package:nutrinowapp/constants/strings.dart';
import 'package:nutrinowapp/models/food/food_details_model.dart';
import 'package:nutrinowapp/models/food/food_search_filter_model.dart';
import 'package:nutrinowapp/ui/pages/food/screens/food_search/food_search_result.dart';
import 'package:nutrinowapp/ui/pages/food/screens/food_search/food_search_result_error.dart';
import 'package:nutrinowapp/ui/pages/food/screens/food_search/food_search_suggestion.dart';

class FoodSearchDelegate extends SearchDelegate<FoodDetailsModel> {
  final String searchFieldLabelText;
  final FoodSearchFilterModel filter;

  FoodSearchDelegate(this.filter,
      {this.searchFieldLabelText = foodSearchFieldLabel})
      : super();

  @override
  List<Widget> buildActions(BuildContext context) {
    final outlineButtonStyle = OutlinedButton.styleFrom(
      primary: Colors.white,
      backgroundColor: themeColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );

    return <Widget>[
      Container(
        margin: EdgeInsets.all(5),
        child: OutlinedButton(
          style: outlineButtonStyle,
          onPressed: () => showResults(context),
          child: Text(
            'GO',
            style: roboto(
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    filter.searchText = query;
    if (filter.isEmpty) return FoodSearchResultErrorEmptySearch();

    return FoodSearchResult(filter);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FoodSearchSuggestion();
  }
}

void openFoodSearch(BuildContext context, {FoodSearchFilterModel? filter}) {
  var foodSearchDelegate =
      FoodSearchDelegate(filter ?? FoodSearchFilterModel.empty());
  showSearch(context: context, delegate: foodSearchDelegate);
  foodSearchDelegate.showResults(context);
}
