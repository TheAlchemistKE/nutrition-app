import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/models/recommendation/recommendation_model.dart';
import 'package:nutrinowapp/ui/pages/recommendation/screens/goals/recommendation_goals_body.dart';
import 'package:nutrinowapp/ui/widgets/modal_dialog.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class RecommendationGoals extends StatelessWidget {
  final RecommendationModel recommendationModel;

  RecommendationGoals(this.recommendationModel);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: Container(
          child: Scaffold(
            appBar: AppBar(
              foregroundColor: themeColor,
              leading: BackButton(color: themeColor),
              backgroundColor: Colors.white,
              elevation: 0,
              title: Center(child: standardHeaderTitle(color: themeColor)),
              actions: [standardChartIconButton(color: themeColor)],
            ),
            body: RecommendationGoalsBody(
              recommendationModel: recommendationModel,
            ),
          ),
        ),
      ),
    );
  }
}

void openRecommendationGoals(
    BuildContext context, RecommendationModel recommendationModel) {
  ModalDialog.showDialogWidget(
    context,
    RecommendationGoals(recommendationModel),
  );
}
