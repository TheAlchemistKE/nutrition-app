import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/models/recommendation/recommendation_model.dart';
import 'package:nutrinowapp/ui/pages/recommendation/screens/recommendation_goals.dart';
import 'package:nutrinowapp/ui/pages/recommendation/screens/recommendation_progress.dart';

class RecommendationProgressGoalButtons extends StatelessWidget {
  final RecommendationModel recommendationModel;
  final bool viewGoalsIsActive;
  final bool trackProgressIsActive;

  const RecommendationProgressGoalButtons(
      {Key? key,
      required this.recommendationModel,
      this.viewGoalsIsActive = false,
      this.trackProgressIsActive = false})
      : assert(
          viewGoalsIsActive == false || trackProgressIsActive == false,
          'Cannot have viewGoalsIsActive $viewGoalsIsActive and trackProgressIsActive $trackProgressIsActive\n',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: 500,
      ),
      child: Row(
        children: [
          Expanded(
            child: RecommendationButton(
              recommendationModel: recommendationModel,
              isActive: viewGoalsIsActive,
              name: 'View Goals',
              onPressed: () => openRecommendationGoals(
                context,
                recommendationModel,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: RecommendationButton(
              recommendationModel: recommendationModel,
              isActive: trackProgressIsActive,
              name: 'Track Progress',
              onPressed: () => openRecommendationProgress(
                context,
                recommendationModel,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecommendationButton extends StatelessWidget {
  final RecommendationModel recommendationModel;
  final bool isActive;
  final Function onPressed;
  final String name;

  const RecommendationButton(
      {Key? key,
      required this.isActive,
      required this.recommendationModel,
      required this.onPressed,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        textStyle: TextStyle(),
        backgroundColor: isActive ? cl2D786E : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () => isActive ? null : onPressed(),
      child: FittedBox(
        child: Text(
          name.toUpperCase(),
          maxLines: 2,
          style: TextStyle(
            color: isActive ? Colors.white : cl2D786E,
            fontWeight: FontWeight.w500,
            fontSize: 12.5,
          ),
        ),
      ),
    );
  }
}
