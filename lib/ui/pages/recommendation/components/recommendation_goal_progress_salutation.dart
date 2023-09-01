import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';

class RecommendationGoalProgressSalutation extends StatelessWidget {
  final String name;

  const RecommendationGoalProgressSalutation({Key? key, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Hi, $name',
        style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w400,
              color: themeColor,
              fontSize: 16,
            ),
      ),
    );
  }
}
