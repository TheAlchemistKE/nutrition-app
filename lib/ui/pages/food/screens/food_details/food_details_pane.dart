import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/models/food/food_details_model.dart';
import 'package:nutrinowapp/ui/pages/food/screens/food_details/food_details_close_icon.dart';
import 'package:nutrinowapp/ui/pages/food/screens/food_details/food_details_description.dart';
import 'package:nutrinowapp/ui/pages/food/screens/food_details/food_details_manufacturer.dart';
import 'package:nutrinowapp/ui/pages/food/screens/food_details/food_details_name.dart';
import 'package:nutrinowapp/ui/pages/food/screens/food_details/food_details_nutrition/food_details_macro_nutrient_pane.dart';
import 'package:nutrinowapp/ui/pages/food/screens/food_details/food_details_nutrition/food_details_micro_nutritient_pane.dart';
import 'package:nutrinowapp/ui/pages/food/screens/food_details/food_details_nutrition/food_details_nutrition_tab.dart';

import 'food_details_nutrition/food_details_nutrition_title.dart';

class FoodDetailsPane extends StatefulWidget {
  final FoodDetailsModel foodDetailsModel;

  const FoodDetailsPane(this.foodDetailsModel, {Key? key}) : super(key: key);

  @override
  _FoodDetailsPaneState createState() => _FoodDetailsPaneState();
}

class _FoodDetailsPaneState extends State<FoodDetailsPane>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFFEFFFE),
            Color(0xFFF8F8FE),
            Color(0xFFEEEEEF),
            Color(0xFFF8F8FA),
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.0, 1.0),
          stops: [0.0, 0.3, 0.45, 0.6, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: NestedScrollView(
        physics: BouncingScrollPhysics(parent: PageScrollPhysics()),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            // Close icon
            SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.topRight,
                child: FoodDetailsCloseIcon(),
              ),
            ),

            // Name & Category
            SliverToBoxAdapter(
              child: FoodDetailsName(widget.foodDetailsModel),
            ),

            // Description
            if (widget.foodDetailsModel.cleanDescription.isNotEmpty)
              SliverToBoxAdapter(
                child: FoodDetailsDescription(widget.foodDetailsModel),
              ),

            // Manufacturer
            if (widget.foodDetailsModel.manufacture.isNotEmpty)
              SliverToBoxAdapter(
                child: FoodDetailsManufacturer(widget.foodDetailsModel),
              ),

            // Title - Nutrition Facts
            SliverToBoxAdapter(
              child: FoodDetailsNutritionTitle(widget.foodDetailsModel),
            ),

            // Macro nutrients
            SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.center,
                child: FoodDetailsMacroNutrientPane(
                  foodItem: widget.foodDetailsModel,
                  limit: 5,
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 40)),

            // Tab bar
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: TabBar(
                  unselectedLabelColor: cl063E3F,
                  labelColor: Colors.white,
                  indicator: BoxDecoration(color: cl063E3F),
                  indicatorColor: Colors.black,
                  controller: _controller,
                  tabs: [
                    FoodDetailsNutritionTab(name: 'Brief'),
                    FoodDetailsNutritionTab(name: 'Detailed'),
                  ],
                  isScrollable: false,
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _controller,
          children: [
            FoodDetailsMicroNutrientPane(
              foodItem: widget.foodDetailsModel,
              isBasic: true,
            ),
            FoodDetailsMicroNutrientPane(
              foodItem: widget.foodDetailsModel,
              isBasic: false,
            )
          ],
        ),
      ),
    );
  }
}
