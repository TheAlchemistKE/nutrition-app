import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';

class MealPlanDetailsPageBodyIngredients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: [for (var i = 0; i < 5; i++) nutrientItem(context)],
    );
  }

  Widget nutrientItem(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(themeColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: themeColor)),
            )),
        onPressed: () {},
        child: Text(
          'Ingredient 1',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
