import 'package:flutter/material.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/models/nutritionist/nutritionist_model.dart';
import 'package:nutrinowapp/ui/pages/home/component/nutritionist/home_page_nutritionist_pane_list_item.dart';

class HomePageNutritionistPaneList extends StatelessWidget {
  final List<NutritionistModel> nutritionists;

  const HomePageNutritionistPaneList({Key? key, required this.nutritionists})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = goldenRatioSmall(size.width);
    var height = 220.0;
    return Container(
      height: height,
      child: ListView.separated(
        shrinkWrap: true,
        controller: ScrollController(keepScrollOffset: false),
        physics: BouncingScrollPhysics(),
        itemCount: nutritionists.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return Container(width: 15);
        },
        itemBuilder: (BuildContext context, int index) {
          return HomePageNutritionistPaneListItem(
            itemHeight: height,
            itemWidth: width,
            nutritionist: nutritionists[index],
          );
        },
      ),
    );
  }
}

class HomePageNutritionistPaneListLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
