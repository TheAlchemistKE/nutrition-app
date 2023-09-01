import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/fonts.dart';

class FoodDetailsNutritionTab extends StatelessWidget {
  final String name;

  const FoodDetailsNutritionTab({Key? key, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      iconMargin: EdgeInsets.zero,
      child: Container(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            name,
            style: roboto(
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
