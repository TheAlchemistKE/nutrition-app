import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/models/recommendation/recommendation_model.dart';
import 'package:nutrinowapp/ui/pages/recommendation/screens/recommendation_detail.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class RecommendationListItem extends StatelessWidget {
  final RecommendationModel recommendationModel;
  final double cardWidth;
  final double imgSize;

  const RecommendationListItem(this.recommendationModel,
      {Key? key, required this.cardWidth, required this.imgSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.transparent, width: 0.0),
      ),
      elevation: 10.0,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        width: cardWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imgSection(context),
            SizedBox(height: 5),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  recommendationModel.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 8),
            // Text(
            //   recommendationModel.description,
            //   maxLines: 3,
            //   overflow: TextOverflow.ellipsis,
            //   style: TextStyle(),
            // ),
            Expanded(
              flex: 1,
              child: Container(
                width: goldenRatioLarge(cardWidth),
                child: viewMoreButton(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget viewMoreButton(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(),
        backgroundColor: themeColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
            side: BorderSide(color: themeColor)),
        side: BorderSide.none,
      ),
      onPressed: () => openRecommendationDetail(context, recommendationModel),
      child: FittedBox(
        child: Text(
          'View more',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget imgSection(BuildContext context) {
    var imgWidth = imgSize;
    var imgHeight = imgSize * 0.85;
    return Container(
      width: imgWidth,
      height: imgHeight,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageBuilder: (context, imageProvider) => Container(
              width: imgWidth,
              height: imgHeight,
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Container(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            imageUrl: Api.api(prefix: 'static')
                .uri(path: recommendationModel.img)
                .toString(),
          ),
          Positioned.fill(
            child: imgOverlay(
              opacity: 0.24,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(6),
                child: Wrap(
                  children: [
                    // Icon(
                    //   Icons.favorite_outline,
                    //   color: Colors.white,
                    //   size: 28,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
