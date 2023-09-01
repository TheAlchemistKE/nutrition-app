import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/models/diary/diary_kind_model.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/generic/generic_diary_page_header_flexible_space.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/generic/generic_diary_page_hint.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/generic/generic_diary_page_history.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/generic/generic_diary_page_progress.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/generic/generic_diary_page_progress_chart.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class GenericDiaryPage extends StatefulWidget {
  final DiaryKindModel diaryModel;

  const GenericDiaryPage(this.diaryModel, {Key? key}) : super(key: key);

  @override
  _GenericDiaryPageState createState() => _GenericDiaryPageState();
}

class _GenericDiaryPageState extends State<GenericDiaryPage> {
  final ScrollController _controller = ScrollController();

  double get headerExpandedHeight {
    var size = MediaQuery.of(context).size;
    return goldenRatioLarge(size.width);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: themeColor,
          body: CustomScrollView(
            controller: _controller,
            slivers: <Widget>[
              SliverAppBar(
                elevation: 0.0,
                floating: true,
                pinned: true,
                backgroundColor: themeColor,
                title: Center(child: standardHeaderTitle()),
                expandedHeight: headerExpandedHeight,
                actions: [standardChartIconButton()],
                flexibleSpace: GenericDiaryPageHeaderFlexibleSpace(
                  diaryModel: widget.diaryModel,
                  opacityCallBack: (double opacity) {
                    // setState(() => headerOpacity = 1 - opacity);
                  },
                ),
              ),
              SliverList(
                // Use a delegate to build items as they're scrolled on screen.
                delegate: SliverChildListDelegate(
                  [
                    GenericDiaryPageProgress(
                      diaryModel: widget.diaryModel,
                    ),
                    SizedBox(height: 35),
                    GenericDiaryPageHint(
                      diaryModel: widget.diaryModel,
                    ),
                    SizedBox(height: 40),
                    GenericDiaryPageProgressChart(
                      diaryModel: widget.diaryModel,
                    ),
                    SizedBox(height: 35),
                    GenericDiaryPageHistory(
                      diaryModel: widget.diaryModel,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
