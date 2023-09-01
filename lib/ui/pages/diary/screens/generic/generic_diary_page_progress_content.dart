import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/models/diary/diary_kind_model.dart';
import 'package:nutrinowapp/models/diary/generic_diary_progress_summary_model.dart.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/generic/generic_diary_page_progress_dialog.dart';
import 'package:nutrinowapp/ui/widgets/shimmer.dart';
import 'package:nutrinowapp/ui/widgets/shimmer_loading.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GenericDiaryPageProgressContent extends StatelessWidget {
  final DiaryKindModel diaryModel;
  final GenericDiaryProgressSummaryModel summary;

  const GenericDiaryPageProgressContent(
      {Key? key, required this.diaryModel, required this.summary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Current weight
          Row(
            children: [
              Text(
                'Current ',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: clA7A7A7,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
              ),
              Text(
                summary.currentDisplay,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: themeColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
              ),
            ],
          ),
          SizedBox(height: 15),
          // Your goal
          Row(
            children: [
              Text(
                'Your goal ',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: clA7A7A7,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
              ),
              Text(
                summary.goalDisplay,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: cl48B7A5,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Progress
          Container(
            child: LinearPercentIndicator(
              lineHeight: 8.0,
              percent: 0.3,
              backgroundColor: Colors.grey.shade300,
              progressColor: cl24992C,
              padding: EdgeInsets.zero,
            ),
          ),
          SizedBox(height: 4),
          // Progress weight start & end label
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                summary.currentDisplay,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: clA7A7A7,
                    ),
              ),
              Text(
                summary.goalDisplay,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: clA7A7A7,
                    ),
              ),
            ],
          ),
          SizedBox(height: 15),
          // Update Weight button

          // Update button
          Align(
            alignment: Alignment.center,
            child: Container(
              width: goldenRatioLarge(size.width),
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  backgroundColor: themeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    side: BorderSide(color: themeColor),
                  ),
                  side: BorderSide.none,
                ),
                onPressed: () => displayDialog(context, diaryModel, summary),
                child: Text(
                  diaryModel.updateButtonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GenericDiaryPageProgressContentLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Shimmer(
      child: ShimmerLoading(
        isLoading: true,
        child: Container(
          width: double.infinity,
          height: goldenRatioLarge(size.width) * 0.75,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
    );
  }
}
