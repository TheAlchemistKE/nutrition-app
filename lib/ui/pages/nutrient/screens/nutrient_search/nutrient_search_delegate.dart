import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/fonts.dart';
import 'package:nutrinowapp/constants/strings.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_model.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_search_filter_model.dart';
import 'package:nutrinowapp/ui/pages/nutrient/screens/nutrient_search/nutrient_search_result.dart';
import 'package:nutrinowapp/ui/pages/nutrient/screens/nutrient_search/nutrient_search_result_error.dart';
import 'package:nutrinowapp/ui/pages/nutrient/screens/nutrient_search/nutrient_search_suggestion.dart';

class NutrientSearchDelegate extends SearchDelegate<NutrientModel> {
  final String searchFieldLabelText;
  final NutrientSearchFilterModel filter;

  NutrientSearchDelegate(this.filter,
      {Key? key, this.searchFieldLabelText = nutrientSearchFieldLabel})
      : super();

  @override
  List<Widget> buildActions(BuildContext context) {
    final outlineButtonStyle = OutlinedButton.styleFrom(
      primary: Colors.white,
      backgroundColor: themeColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
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
    if (filter.isEmpty) return NutrientSearchResultErrorEmptySearch();

    return NutrientSearchResult(filter);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return NutrientSearchSuggestion();
  }
}

void openNutrientSearch(
    BuildContext context, NutrientSearchFilterModel filter) {
  var nutrientSearchDelegate = NutrientSearchDelegate(filter);
  showSearch(context: context, delegate: nutrientSearchDelegate);

  nutrientSearchDelegate.showResults(context);
}
