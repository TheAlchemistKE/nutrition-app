import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/service/nutrient/nutrient_service.dart';
import 'package:nutrinowapp/ui/pages/home/component/nutrient/home_page_nutrient_intake_pane_list.dart';
import 'package:nutrinowapp/ui/pages/nutrient/screens/nutrient_category/nutrient_category_view_all.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';

class HomePageNutrientIntakePane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => openNutrientCategoryViewAll(context),
            child: Row(
              children: [
                Text(
                  'Nutrient Intake',
                  style: TextStyle(
                    color: themeColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Text('View all'),
              ],
            ),
          ),
          SizedBox(height: 10),
          customFutureBuilderRecommendedIntakeList(),
        ],
      ),
    );
  }

  Widget customFutureBuilderRecommendedIntakeList() {
    return Container(
      child: CustomFutureBuilder(
        source: NutrientService.fetchNutrientCategories(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!(snapshot.data is List<dynamic>) ||
              !snapshot.hasData ||
              snapshot.data.length < 1) {
            return Container();
          }
          // return RecommendedIntakePaneListLoader();
          return RecommendedIntakePaneList(nutrientCategories: snapshot.data);
        },
        loader: RecommendedIntakePaneListLoader(),
        errorHandler: (error) => RecommendedIntakePaneListLoader(),
      ),
    );
  }
}
