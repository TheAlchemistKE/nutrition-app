import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/models/diary/diary_kind_model.dart';
import 'package:nutrinowapp/models/diary/generic_diary_progress_summary_model.dart.dart';
import 'package:nutrinowapp/ui/widgets/counter_view.dart';

class GenericDiaryPageProgressDialog extends StatelessWidget {
  final DiaryKindModel diaryModel;
  final GenericDiaryProgressSummaryModel summary;

  const GenericDiaryPageProgressDialog(
      {Key? key, required this.diaryModel, required this.summary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              diaryModel.updateSectionTitleText,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: themeColor,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your goal: ${summary.goalDisplay}',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: themeColor,
                        // fontWeight: FontWeight.w500,
                      ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade400),
                    ),
                  ),
                  child: Text(
                    'Change goal',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade400,
                        ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Change the value below',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: themeColor,
                  // fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(height: 15),
          CounterView(
            initNumber: 65,
            iconColor: Colors.grey.shade500,
            counterCallback: (int val) {},
          ),
          SizedBox(height: 15),
          ElevatedButton(
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
            onPressed: () {},
            child: FittedBox(
              child: Text(
                diaryModel.updateButtonCommitText,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void displayDialog(BuildContext context, DiaryKindModel diaryModel,
    GenericDiaryProgressSummaryModel summary) {
  showGeneralDialog(
    barrierLabel: 'Barrier',
    transitionDuration: Duration(milliseconds: 400),
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      var size = MediaQuery.of(context).size;
      return Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          margin: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IntrinsicHeight(
            child: GenericDiaryPageProgressDialog(
              diaryModel: diaryModel,
              summary: summary,
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, anim, anim2, child) {
      return Transform.scale(
        scale: anim.value,
        // position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
        child: Opacity(opacity: anim.value, child: child),
      );
    },
  );
}
