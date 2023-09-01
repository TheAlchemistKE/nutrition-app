import 'package:flutter/material.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_model.dart';
import 'package:nutrinowapp/ui/pages/nutrient/components/nutrient_list_tile.dart';

class NutrientsResultPane extends StatelessWidget {
  final List<NutrientModel> nutrientsModel;

  const NutrientsResultPane(this.nutrientsModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return NutrientListTile(nutrientsModel[index]);
        },
        separatorBuilder: (context, index) {
          return Divider(color: Colors.white24, height: 10);
        },
        itemCount: nutrientsModel.length,
      ),
    );
  }
}
