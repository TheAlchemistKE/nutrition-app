import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/models/diary/diary_kind_model.dart';
import 'package:nutrinowapp/ui/pages/diary/diary_page.dart';
import 'package:nutrinowapp/ui/pages/food/components/shimmer/loader.dart';
import 'package:nutrinowapp/ui/widgets/network_img_icon.dart';
import 'package:nutrinowapp/ui/widgets/shimmer_loading.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class DiaryCategoryItem extends StatelessWidget {
  final DiaryKindModel diaryModel;
  final double borderRadius = 10.0;

  const DiaryCategoryItem({Key? key, required this.diaryModel})
      : super(key: key);

  Widget bgImgOverlay(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutQuint,
      decoration: BoxDecoration(
        border: Border.all(
          color: themeColor.withOpacity(0.01),
          width: 0.25,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: CachedNetworkImage(
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
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
              Radius.circular(borderRadius),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
        imageUrl: Api.api(prefix: 'static')
            .uri(path: diaryModel.thumbnail)
            .toString(),
      ),
    );
  }

  Widget overlayContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 2, child: Container()),
          Expanded(
            flex: 3,
            child: diaryModel.iconImg.isEmpty
                ? Container()
                : NetworkImgIcon(
                    Api.api(prefix: 'static').uri(path: diaryModel.iconImg),
                  ),
          ),
          Expanded(flex: 1, child: Container()),
          Expanded(
            child: Text(
              diaryModel.name.toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(flex: 1, child: Container()),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    themeColor,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.white,
                  ),
                  // padding: MaterialStateProperty.all<EdgeInsets>(
                  //     EdgeInsets.symmetric(vertical: 18, horizontal: 30)),
                ),
                onPressed: () => openDiaryScreen(context, diaryModel),
                child: FittedBox(child: Text('View more')),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Stack(
          children: [
            // Image
            Positioned.fill(child: bgImgOverlay(context)),
            // Overlay
            Positioned.fill(
              child: imgOverlay(
                opacity: diaryModel.overlayOpacity,
                color: diaryModel.overlayColor.toColor(),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),

            Positioned.fill(child: overlayContent(context)),
          ],
        ),
      ),
    );
  }
}

class DiaryCategoryItemLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var borderRadius = 10.0;

    return ShimmerLoading(
      isLoading: true,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.white,
        ),
      ),
    );
  }
}
