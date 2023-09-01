import 'package:flutter/material.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/ui/pages/recommendation/loader/recommendation_grid_list_loader.dart';
import 'package:nutrinowapp/ui/widgets/shimmer.dart';
import 'package:nutrinowapp/ui/widgets/shimmer_loading.dart';

class RecommendationListSuggestedSectionLoader extends StatelessWidget {
  final int itemCount;

  const RecommendationListSuggestedSectionLoader({Key? key, this.itemCount = 4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardWidth = goldenRatioLarge(size.width);

    return Shimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerLoading(
            isLoading: true,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Container(
                width: 150,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          RecommendationGridListLoader(cardWidth: cardWidth, length: itemCount),
        ],
      ),
    );
  }
}
