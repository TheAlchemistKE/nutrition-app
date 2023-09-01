import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/dimensions.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/models/recommendation/suggested_recommendations_model.dart';
import 'package:nutrinowapp/ui/pages/recommendation/components/recommendation_list_item.dart';
import 'package:nutrinowapp/ui/pages/recommendation/components/recommendation_list_suggested_title.dart';

class RecommendationListSuggestedSection extends StatelessWidget {
  final SuggestedRecommendationsModel section;

  const RecommendationListSuggestedSection({Key? key, required this.section})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardWidth = idealSize(
      goldenRatioLarge(size.width),
      kMinWidthPane,
      kMaxWidthPane,
    );
    var imgSize = goldenRatioLarge(cardWidth);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RecommendationListSuggestedTitle(title: section.title),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: GridView.extent(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              maxCrossAxisExtent: cardWidth,
              childAspectRatio: 0.65,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [
                for (var item in section.items)
                  RecommendationListItem(
                    item,
                    cardWidth: cardWidth,
                    imgSize: imgSize,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
