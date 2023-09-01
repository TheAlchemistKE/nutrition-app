import 'package:flutter/material.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_search_filter_model.dart';
import 'package:nutrinowapp/service/nutrient/nutrient_service.dart';
import 'package:nutrinowapp/ui/pages/nutrient/components/nutrients_result_pane.dart';
import 'package:nutrinowapp/ui/pages/nutrient/screens/nutrient_search/nutrient_search_result_error.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class NutrientSearchResult extends StatelessWidget {
  final NutrientSearchFilterModel filter;

  const NutrientSearchResult(this.filter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: CustomFutureBuilder(
          source: NutrientService.searchNutrient(filter.toJson()),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!(snapshot.data is List<dynamic>) ||
                !snapshot.hasData ||
                (snapshot.data as List<dynamic>).isEmpty) {
              return NutrientSearchResultNotFound();
            }

            return NutrientsResultPane(snapshot.data);
          },
          loader: circularProgress,
          errorHandler: (error) => FutureBuilderErrorDisplay('$error'),
        ),
      ),
    );
  }
}
