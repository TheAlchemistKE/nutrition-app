import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/dimensions.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/models/recommendation/recommendation_model.dart';
import 'package:nutrinowapp/ui/pages/recommendation/screens/detail/recommendation_detail_body.dart';
import 'package:nutrinowapp/ui/pages/recommendation/screens/detail/recommendation_detail_header.dart';
import 'package:nutrinowapp/ui/widgets/modal_dialog.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class RecommendationDetail extends StatelessWidget {
  final RecommendationModel recommendationModel;

  final topHeaderMinHeight = 220.0;
  final btmSectionBorderRadius = 50.0;

  const RecommendationDetail(this.recommendationModel);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var headerHeight = idealSize(
      goldenRatioLarge(min(size.width, size.height)),
      topHeaderMinHeight,
      kTopHeaderMaxHeight,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: themeColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: size.width,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            width: double.infinity,
                            height: headerHeight + btmSectionBorderRadius,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Container(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            imageUrl: Api.api(prefix: 'static')
                                .uri(path: recommendationModel.img)
                                .toString(),
                          ),
                          Positioned.fill(
                            child: Container(
                              height: headerHeight + btmSectionBorderRadius,
                              child: imgOverlay(
                                opacity: 0.65,
                                color: themeColor,
                              ),
                            ),
                          ),
                          RecommendationDetailHeader(
                            recommendationModel,
                            height: headerHeight,
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              width: size.width,
                              height: btmSectionBorderRadius,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.only(
                                  topRight:
                                      Radius.circular(btmSectionBorderRadius),
                                  topLeft:
                                      Radius.circular(btmSectionBorderRadius),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                      ),
                      child: RecommendationDetailBody(recommendationModel),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void openRecommendationDetail(
    BuildContext context, RecommendationModel recommendationModel) {
  ModalDialog.showDialogWidget(
    context,
    RecommendationDetail(recommendationModel),
  );
}
