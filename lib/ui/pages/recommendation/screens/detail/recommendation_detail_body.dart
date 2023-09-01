import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/models/recommendation/recommendation_model.dart';
import 'package:nutrinowapp/ui/pages/recommendation/screens/recommendation_goals.dart';
import 'package:nutrinowapp/ui/pages/recommendation/screens/recommendation_progress.dart';
import 'package:nutrinowapp/ui/widgets/html_wrapper.dart';

class RecommendationDetailBody extends StatelessWidget {
  final RecommendationModel recommendationModel;

  RecommendationDetailBody(this.recommendationModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 40, left: 40, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (recommendationModel.healthConditionModel.description.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!
                      .recommendationDetailsBodyWhatIsIt
                      .toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: themeColor,
                  ),
                ),
                SizedBox(height: 10),
                HtmlWrapper(
                  recommendationModel.healthConditionModel.description,
                ),
                SizedBox(height: 30),
              ],
            ),

          // Life style changes
          if (recommendationModel.lifestyleRecommendation.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!
                      .recommendationDetailsBodyLifeStyleChanges
                      .toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: themeColor,
                  ),
                ),
                SizedBox(height: 10),
                HtmlWrapper(recommendationModel.lifestyleRecommendation),
                SizedBox(height: 30),
              ],
            ),

          // Dietary changes
          if (recommendationModel.nutritionRecommendation.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!
                      .recommendationDetailsBodyDietaryChanges
                      .toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: themeColor,
                  ),
                ),
                SizedBox(height: 10),
                HtmlWrapper(recommendationModel.nutritionRecommendation),
                SizedBox(height: 20),
              ],
            ),

          RecommendationDetailBodyButtons(
            recommendationModel: recommendationModel,
          ),
        ],
      ),
    );
  }
}

class RecommendationDetailBodyButtons extends StatelessWidget {
  final RecommendationModel recommendationModel;

  const RecommendationDetailBodyButtons(
      {Key? key, required this.recommendationModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.spaceBetween,
      spacing: 15,
      children: [
        OutlinedButton(
          style: TextButton.styleFrom(
            textStyle: TextStyle(),
            backgroundColor: cl2D786E,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () =>
              openRecommendationGoals(context, recommendationModel),
          child: Text(
            AppLocalizations.of(context)!
                .recommendationDetailsViewGoalsButtonText
                .toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        OutlinedButton(
          style: TextButton.styleFrom(
            textStyle: TextStyle(),
            backgroundColor: cl2D786E,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () => '',
          child: Text(
            'View Meal Plan',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        OutlinedButton(
          style: TextButton.styleFrom(
            textStyle: TextStyle(),
            backgroundColor: cl2D786E,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () => openRecommendationProgress(
            context,
            recommendationModel,
          ),
          child: Text(
            AppLocalizations.of(context)!
                .recommendationDetailsTrackProgressButtonText
                .toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
