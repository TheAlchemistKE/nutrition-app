import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/models/diary/diary_kind_model.dart';
import 'package:nutrinowapp/ui/pages/food/components/shimmer/loader.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class FoodDiaryPageHeader extends StatelessWidget {
  final double height;
  final DiaryKindModel diaryModel;

  const FoodDiaryPageHeader(
      {Key? key, required this.height, required this.diaryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        children: [
          Text(
            diaryModel.name,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 28,
                ),
          ),
          SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: height,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CachedNetworkImage(
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Loader(),
                      errorWidget: (context, url, error) => Loader(),
                      imageUrl: Api.api(prefix: 'static')
                          .uri(path: diaryModel.img)
                          .toString(),
                    ),
                  ),
                  Positioned.fill(child: imgOverlay(opacity: 0.38)),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        minHeight: 10,
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          cl0097C0,
                        ),
                        value: 0.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
