import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/models/diary/diary_kind_model.dart';
import 'package:nutrinowapp/ui/pages/food/components/shimmer/loader.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

typedef FunctionOpacityCallBack = Function(double);

class GenericDiaryPageHeaderFlexibleSpace extends StatefulWidget {
  final FunctionOpacityCallBack opacityCallBack;
  final DiaryKindModel diaryModel;

  const GenericDiaryPageHeaderFlexibleSpace(
      {Key? key, required this.opacityCallBack, required this.diaryModel})
      : super(key: key);

  @override
  _GenericDiaryPageHeaderFlexibleSpaceState createState() =>
      _GenericDiaryPageHeaderFlexibleSpaceState();
}

class _GenericDiaryPageHeaderFlexibleSpaceState
    extends State<GenericDiaryPageHeaderFlexibleSpace> {
  var opacity = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(GenericDiaryPageHeaderFlexibleSpace oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  double genOpacity(BuildContext context) {
    final settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    if (settings != null) {
      final deltaExtent = settings.maxExtent - settings.minExtent;
      final t =
          (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent)
              .clamp(0.0, 1.0);
      final fadeStart = max(0.0, 1.0 - kToolbarHeight / deltaExtent);
      const fadeEnd = 1.0;
      return 1.0 - Interval(fadeStart, fadeEnd).transform(t);
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    executeAfterBuild();

    return LayoutBuilder(
      builder: (context, c) {
        var size = MediaQuery.of(context).size;
        opacity = genOpacity(context);
        if (opacity < 0.5) return Container();
        return Opacity(
          opacity: opacity,
          child: Container(
            decoration: BoxDecoration(
              border: Border.fromBorderSide(BorderSide.none),
            ),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Loader(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  imageUrl: Api.api(prefix: 'static')
                      .uri(path: widget.diaryModel.img)
                      .toString(),
                ),
                imgOverlay(opacity: 0.85, color: cl2F3B14),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: goldenRatioLarge(size.width),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.diaryModel.name,
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            widget.diaryModel.quoteOfTheDay,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Colors.white,
                                    ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: themeColor,
                      border: Border.fromBorderSide(BorderSide.none),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> executeAfterBuild() async {
    widget.opacityCallBack(opacity);
  }
}
