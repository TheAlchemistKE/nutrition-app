import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nutrinowapp/models/recommendation/recommendation_model.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class RecommendationDetailHeader extends StatelessWidget {
  final double height;

  final RecommendationModel recommendationModel;

  RecommendationDetailHeader(this.recommendationModel, {required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            primary: true,
            leading: BackButton(color: Colors.white),
            title: Center(child: standardHeaderTitle()),
            actions: [standardChartIconButton()],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    recommendationModel.title.toUpperCase(),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppLocalizations.of(context)!
                        .recommendationDetailsHeaderSubTitle
                        .toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
