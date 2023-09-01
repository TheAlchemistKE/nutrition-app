import 'package:flutter/material.dart';
import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/models/diary/diary_kind_model.dart';
import 'package:nutrinowapp/ui/pages/home/component/diary/home_page_my_diary_pane_list.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';

class HomePageMyDiaryPane extends StatefulWidget {
  @override
  _HomePageMyDiaryPaneState createState() => _HomePageMyDiaryPaneState();
}

class _HomePageMyDiaryPaneState extends State<HomePageMyDiaryPane> {
  late Future<dynamic> _futureDiaries;

  @override
  void initState() {
    super.initState();
    _futureDiaries = Api.api().get('/nutrient-category');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'My Diary',
                style: TextStyle(
                  color: themeColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              Spacer(),
              Text('View All'),
            ],
          ),
          SizedBox(height: 10),
          customFutureBuilderHomePageMyDiaryList(),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget customFutureBuilderHomePageMyDiaryList() {
    return Container(
      child: CustomFutureBuilder(
        source: _futureDiaries,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!(snapshot.data is List<dynamic>) ||
              !snapshot.hasData ||
              snapshot.data.length < 1) {
            return Container();
          }

          var nutrientCats = <DiaryKindModel>[];
          // snapshot.data.forEach(
          //     (i) => nutrientCats.add(DiaryModel.fromJson(i)));

          // return HomePageMyDiaryPaneListLoader();
          return HomePageMyDiaryPaneList();
          // return RecommendedIntakePaneList(nutrientCategories: nutrientCats);
        },
        loader: HomePageMyDiaryPaneListLoader(),
        errorHandler: (error) => HomePageMyDiaryPaneListLoader(),
      ),
    );
  }
}
