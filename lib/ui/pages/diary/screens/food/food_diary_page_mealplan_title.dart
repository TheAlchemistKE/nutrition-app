import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';

class FoodDiaryPageBodyMealPlanTitle extends StatelessWidget {
  final String title;

  const FoodDiaryPageBodyMealPlanTitle({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: themeColor,
                    fontSize: 17,
                  ),
            ),
            SizedBox(height: 10),
            Text(
              'Recommended',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: themeColor,
                  ),
            ),
          ],
        ),
        Expanded(child: Container()),
        Text('300 kcal')
      ],
    );
  }
}
