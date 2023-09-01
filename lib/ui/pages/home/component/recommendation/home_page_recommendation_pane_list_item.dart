import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/models/recommendation/recommendation_model.dart';
import 'package:nutrinowapp/ui/pages/food/components/shimmer/loader.dart';
import 'package:nutrinowapp/ui/pages/recommendation/screens/recommendation_detail.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class HomePageRecommendationPaneListItem extends StatelessWidget {
  final RecommendationModel recommendationModel;
  final double cardWidth;

  const HomePageRecommendationPaneListItem(
      {Key? key, required this.recommendationModel, required this.cardWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openRecommendationDetail(context, recommendationModel),
      child: Card(
        color: themeColor,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          width: cardWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        recommendationModel.title.toUpperCase(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text(
                        recommendationModel.healthConditionModel.description,
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 4),
                    Expanded(child: SizedBox()),
                    Container(
                      constraints: BoxConstraints(maxHeight: 20),
                      child: viewMoreButton(context),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Container(
                  width: goldenRatioSmall(cardWidth),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => Loader(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        imageUrl: Api.api(prefix: 'static')
                            .uri(path: recommendationModel.img)
                            .toString(),
                      ),
                      imgOverlay(
                        color: Colors.black,
                        opacity: 0.18,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget viewMoreButton(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: themeColor),
        ),
        side: BorderSide.none,
      ),
      onPressed: () => openRecommendationDetail(context, recommendationModel),
      child: FittedBox(
        child: Text(
          'View more',
          style: TextStyle(color: themeColor, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class HomePageRecommendationPaneListItemLoader extends StatelessWidget {
  final double cardWidth;

  const HomePageRecommendationPaneListItemLoader({
    Key? key,
    required this.cardWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: themeColor,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        width: cardWidth,
      ),
    );
  }
}
