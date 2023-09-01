import 'package:flutter/material.dart';
import 'package:nutrinowapp/models/diary/diary_kind_model.dart';
import 'package:nutrinowapp/models/diary/generic_diary_history_model.dart';
import 'package:nutrinowapp/service/diary/generic/generic_diary_service.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/generic/generic_diary_page_history_item.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';
import 'package:nutrinowapp/ui/widgets/shimmer.dart';

class GenericDiaryPageHistory extends StatelessWidget {
  final DiaryKindModel diaryModel;

  const GenericDiaryPageHistory({Key? key, required this.diaryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Your history',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          SizedBox(height: 10),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: GenericDiaryPageHistoryPane(diaryModel: diaryModel))
        ],
      ),
    );
  }
}

class GenericDiaryPageHistoryPane extends StatelessWidget {
  final DiaryKindModel diaryModel;

  const GenericDiaryPageHistoryPane({Key? key, required this.diaryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomFutureBuilder(
        source: GenericDiaryService.fetchHistory(diaryModel),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!(snapshot.data is List<dynamic>) ||
              !snapshot.hasData ||
              snapshot.data.length < 1) {
            return Container();
          }
          return listView(snapshot.data);
        },
        loader: GenericDiaryPageHistoryPaneListViewLoader(),
        errorHandler: (error) => GenericDiaryPageHistoryPaneListViewLoader(),
      ),
    );
  }

  Widget listView(List<GenericDiaryHistoryModel> diaryHistory) {
    return Container(
      child: Column(
        children: List.generate(
          diaryHistory.length,
          (int index) =>
              GenericDiaryPageHistoryItem(historyModel: diaryHistory[index]),
        ),
      ),
    );
  }
}

class GenericDiaryPageHistoryPaneListViewLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Column(
        children: List.generate(
          10,
          (index) => GenericDiaryPageHistoryItemLoader(),
        ),
      ),
    );
  }
}
