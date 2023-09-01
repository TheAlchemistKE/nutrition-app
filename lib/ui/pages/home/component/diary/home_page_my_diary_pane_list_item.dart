import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/ui/widgets/shimmer_loading.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class MyDiaryPaneListItem extends StatelessWidget {
  final double cardHeight;
  final double cardWidth;

  const MyDiaryPaneListItem({
    Key? key,
    required this.cardHeight,
    required this.cardWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cl401A49,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: goldenRatioLarge(cardWidth),
              child: ListTile(
                title: Container(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    'MORNING MEAL',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                  ),
                ),
                subtitle: Text(
                  'Drink plenty of water ' * 20,
                  style: TextStyle(color: clB7A9BB),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
              width: goldenRatioSmall(cardWidth),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Container(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    imageUrl: Api.api(prefix: 'static')
                        .uri(path: 'images/food-categories/baked-products.jpg')
                        .toString(),
                  ),
                  imgOverlay(color: Colors.black, opacity: 0.18),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDiaryPaneListItemLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardWidth = min(size.width * 0.7, 550.0);
    var cardHeight = goldenRatioLarge(cardWidth);

    return ShimmerLoading(
      isLoading: true,
      child: Container(
        width: cardWidth,
        child: Card(
          color: Colors.white,
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            width: cardWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: goldenRatioLarge(cardWidth),
                  child: ListTile(
                    title: Container(
                      padding: EdgeInsets.symmetric(vertical: 6),
                    ),
                    subtitle: Container(),
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
