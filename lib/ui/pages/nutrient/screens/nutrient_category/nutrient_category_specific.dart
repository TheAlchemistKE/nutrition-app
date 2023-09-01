import 'package:flutter/material.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_category_model.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_model.dart';
import 'package:nutrinowapp/service/nutrient/nutrient_service.dart';
import 'package:nutrinowapp/ui/pages/nutrient/components/nutrient_list_tile.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class NutrientCategorySpecific extends StatelessWidget {
  final NutrientCategoryModel category;

  const NutrientCategorySpecific(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomFutureBuilder(
        source: NutrientService.fetchNutrientCategoryNutrients(category),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!(snapshot.data is List<dynamic>) ||
              !snapshot.hasData ||
              snapshot.data.length < 1) {
            return Container();
          }

          return NutrientCategorySpecificPane(snapshot.data);
        },
        loader: circularProgress,
        errorHandler: (error) => FutureBuilderErrorDisplay(error.toString()),
      ),
    );
  }
}

class NutrientCategorySpecificPane extends StatelessWidget {
  final List<NutrientModel> nutrients;

  const NutrientCategorySpecificPane(this.nutrients, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Scrollbar(
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => NutrientListTile(nutrients[index]),
          separatorBuilder: (context, index) {
            return Divider(color: Colors.white24, height: 10);
          },
          itemCount: nutrients.length,
        ),
      ),
    );
  }
}
