import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/fonts.dart';
import 'package:nutrinowapp/models/food/food_category_model.dart';
import 'package:nutrinowapp/models/food/food_search_filter_model.dart';
import 'package:nutrinowapp/ui/pages/food/components/shimmer/loader.dart';
import 'package:nutrinowapp/ui/pages/food/screens/food_search/food_search_delegate.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class FoodPageCategory extends StatelessWidget {
  final FoodCategoryModel category;

  const FoodPageCategory(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var filter = FoodSearchFilterModel(categories: [category.id]);
    return GestureDetector(
      onTap: () => openFoodSearch(context, filter: filter),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Stack(
          children: <Widget>[
            // Image
            Positioned.fill(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOutQuint,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: themeColor.withOpacity(0.01),
                    width: 0.25,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Loader(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  imageUrl: Api.api(prefix: 'static')
                      .uri(path: category.img)
                      .toString(),
                ),
              ),
            ),

            // Overlay
            Positioned.fill(
              child: imgOverlay(
                opacity: 0.6,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),

            // Category name
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    category.name,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    style: opensSans(
                        style: TextStyle(
                      height: 1.1,
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
