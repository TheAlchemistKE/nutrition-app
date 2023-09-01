import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/models/diary/diary_kind_model.dart';
import 'package:nutrinowapp/service/diary/generic/generic_diary_service.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/generic/generic_diary_page_progress_content.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';

class GenericDiaryPageProgress extends StatelessWidget {
  final DiaryKindModel diaryModel;

  const GenericDiaryPageProgress({Key? key, required this.diaryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: themeColor,
        border: Border.fromBorderSide(BorderSide.none),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Your progress',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          SizedBox(height: 10),
          customFutureBuilderGenericDiaryPageProgressContent(),
        ],
      ),
    );
  }

  Widget customFutureBuilderGenericDiaryPageProgressContent() {
    return CustomFutureBuilder(
      source: GenericDiaryService.fetchProgressSummary(diaryModel),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return GenericDiaryPageProgressContentLoader();
        }

        return GenericDiaryPageProgressContent(
          diaryModel: diaryModel,
          summary: snapshot.data,
        );
      },
      loader: GenericDiaryPageProgressContentLoader(),
      errorHandler: (error) => GenericDiaryPageProgressContentLoader(),
    );
  }
}
