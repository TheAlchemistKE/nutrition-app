import 'package:flutter/material.dart';
import 'package:nutrinowapp/models/diary/diary_kind_model.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/generic/generic_diary_page_progress_chart_content.dart';

class GenericDiaryPageProgressChart extends StatelessWidget {
  final DiaryKindModel diaryModel;

  const GenericDiaryPageProgressChart({Key? key, required this.diaryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Your progress chart',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          SizedBox(height: 10),
          GenericDiaryPageProgressChartContent(),
        ],
      ),
    );
  }
}
