import 'package:flutter/material.dart';

class RecommendationListSuggestedTitle extends StatelessWidget {
  final String title;

  const RecommendationListSuggestedTitle({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: Colors.white,
              fontSize: 18,
            ),
      ),
    );
  }
}
