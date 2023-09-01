import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_category_model.dart';
import 'package:nutrinowapp/ui/pages/nutrient/screens/nutrient_category/nutrient_category.dart';
import 'package:nutrinowapp/ui/widgets/shimmer_loading.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class RecommendedIntakePaneListItem extends StatelessWidget {
  final NutrientCategoryModel nutrientCategory;
  final double cardWidth;

  const RecommendedIntakePaneListItem({
    Key? key,
    required this.nutrientCategory,
    required this.cardWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openNutrientCategory(context, nutrientCategory),
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: cl2D786E,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: goldenRatioLarge(cardWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        nutrientCategory.name,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                      ),
                    ),
                    Container(
                      child: Text(
                        nutrientCategory.categoryType.name,
                        style: TextStyle(color: clACCAC6),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: goldenRatioSmall(cardWidth),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageBuilder: (context, imageProvider) => Container(
                        clipBehavior: Clip.none,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            scale: 1,
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => ShimmerLoading(
                        isLoading: true,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      errorWidget: (context, url, error) => ShimmerLoading(
                        isLoading: true,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      imageUrl: Api.api(prefix: 'static')
                          .uri(path: nutrientCategory.img)
                          .toString(),
                    ),
                    imgOverlay(color: Colors.black, opacity: 0.18),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendedIntakePaneListItemLoader extends StatelessWidget {
  final double cardWidth;

  const RecommendedIntakePaneListItemLoader({
    Key? key,
    required this.cardWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          width: cardWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: goldenRatioLarge(cardWidth),
                child: ListTile(
                  title: Container(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    width: double.infinity,
                    color: Colors.black,
                    height: 15,
                  ),
                  subtitle: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        width: double.infinity,
                        color: Colors.black,
                        height: 8,
                      ),
                      SizedBox(height: 4),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        width: double.infinity,
                        color: Colors.black,
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
