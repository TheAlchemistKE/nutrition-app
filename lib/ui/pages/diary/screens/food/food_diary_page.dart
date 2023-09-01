import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/models/diary/diary_kind_model.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/food/food_diary_page_body.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/food/food_diary_page_header.dart';
import 'package:nutrinowapp/ui/widgets/sliver_delegate.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class FoodDiaryPage extends StatefulWidget {
  final DiaryKindModel diaryModel;

  const FoodDiaryPage(this.diaryModel, {Key? key}) : super(key: key);

  @override
  _FoodDiaryPageState createState() => _FoodDiaryPageState();
}

class _FoodDiaryPageState extends State<FoodDiaryPage> {
  final ScrollController _controller = ScrollController();
  var isPinned = false;

  var headerHeight;
  var titleHeaderHeight = 70.0;

  @override
  void initState() {
    super.initState();

    // _controller.addListener(() {
    //   if (!isPinned &&
    //       _controller.hasClients &&
    //       _controller.offset >
    //           (headerHeight + kToolbarHeight + titleHeaderHeight)) {
    //     setState(() => isPinned = true);
    //   } else if (isPinned &&
    //       _controller.hasClients &&
    //       _controller.offset <
    //           (headerHeight + kToolbarHeight + titleHeaderHeight)) {
    //     setState(() => isPinned = false);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    headerHeight = goldenRatioSmall(size.width);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: themeColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: themeColor,
          body: CustomScrollView(
            controller: _controller,
            physics: ClampingScrollPhysics(),
            slivers: [
              SliverAppBar(
                backgroundColor: themeColor,
                elevation: 0.0,
                floating: true,
                title: Center(child: standardHeaderTitle()),
                actions: [standardChartIconButton()],
              ),
              SliverToBoxAdapter(
                child: FoodDiaryPageHeader(
                  height: headerHeight,
                  diaryModel: widget.diaryModel,
                ),
              ),
              SliverPersistentHeader(
                pinned: isPinned,
                delegate: SliverDelegate(
                  minHeight: titleHeaderHeight,
                  maxHeight: titleHeaderHeight,
                  child: FoodDiaryPageBodyTitle(isPinned: isPinned),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [FoodDiaryPageBody()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
