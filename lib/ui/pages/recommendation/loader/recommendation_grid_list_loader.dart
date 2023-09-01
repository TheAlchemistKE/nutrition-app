import 'package:flutter/material.dart';
import 'package:nutrinowapp/ui/pages/recommendation/loader/recommendation_list_item_loader.dart';
import 'package:nutrinowapp/ui/widgets/shimmer.dart';

class RecommendationGridListLoader extends StatelessWidget {
  final int length;
  final double cardWidth;

  const RecommendationGridListLoader(
      {Key? key, this.length = 12, required this.cardWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GridView.extent(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          maxCrossAxisExtent: cardWidth,
          childAspectRatio: 0.65,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: [
            for (var i = 0; i < length; i++)
              RecommendationListItemLoader(
                cardWidth: cardWidth,
              ),
          ],
        ),
      ),
    );
  }
}
