import 'package:flutter/material.dart';
import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/constants/fonts.dart';
import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/models/food/food_details_model.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_category_model.dart';
import 'package:nutrinowapp/ui/pages/food/components/food_details/slider/food_details_nutrient_slider.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class FoodDetailsMicroNutrientPane extends StatefulWidget {
  final FoodDetailsModel foodItem;
  final bool isBasic;

  const FoodDetailsMicroNutrientPane(
      {Key? key, required this.foodItem, required this.isBasic})
      : super(key: key);

  @override
  _FoodDetailsMicroNutrientPaneState createState() =>
      _FoodDetailsMicroNutrientPaneState();
}

class _FoodDetailsMicroNutrientPaneState
    extends State<FoodDetailsMicroNutrientPane> {
  late Future<dynamic> _futureMicro;

  @override
  void initState() {
    super.initState();
    setFutureCategory();
  }

  void setFutureCategory() => _futureMicro = Api.api().get(
      '/food/${widget.foodItem.id}/micro-nutrients',
      query: {'is_basic': '${widget.isBasic}'});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: CustomFutureBuilder(
        source: _futureMicro,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!(snapshot.data is List<dynamic>) ||
              !snapshot.hasData ||
              snapshot.data.length < 1) {
            return _buildErrorWidget();
          }

          var cats = List<NutrientCategoryModel>.from(snapshot.data
              .map((n) => NutrientCategoryModel.fromJson(n))
              .toList());

          return ListView.builder(
            itemCount: cats.length,
            itemBuilder: (BuildContext context, int index) {
              var cat = cats[index];
              if (cat.nutrients.isEmpty) return Container();

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: Colors.grey.shade200, width: 1),
                ),
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nutrient title
                    Container(
                      child: Text(
                        (cat.name + ' PER SERVING').allInCaps,
                        style: roboto(
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Nutrient list
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: cat.nutrients.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return FoodDetailsNutrientSlider(
                          cat.nutrients[index],
                          width: 100,
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        loader: circularProgress,
        errorHandler: (error) => FutureBuilderErrorDisplay('$error'),
      ),
    );
  }

  Widget _buildErrorWidget() => Container();
}
