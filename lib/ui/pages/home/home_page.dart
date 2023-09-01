import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/provider/application/application_provider.dart';
import 'package:nutrinowapp/ui/pages/home/component/diary/home_page_my_diary_pane.dart';
import 'package:nutrinowapp/ui/pages/home/component/landing/home_page_landing_slideshow_pane.dart';
import 'package:nutrinowapp/ui/pages/home/component/nutrient/home_page_nutrient_intake_pane.dart';
import 'package:nutrinowapp/ui/pages/home/component/nutritionist/home_page_nutritionist_pane.dart';
import 'package:nutrinowapp/ui/pages/home/component/recommendation/home_page_recommendation_pane.dart';
import 'package:nutrinowapp/ui/widgets/page_footer.dart';
import 'package:nutrinowapp/ui/widgets/side_menu.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final dataKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Provider.of<ApplicationProvider>(context, listen: true)
        .displayConnectionChangeSnackBar(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: themeColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          drawer: Drawer(child: SideMenu()),
          bottomNavigationBar: PageFooter(currentIndex: 0),
          body: CustomScrollView(
            physics: ClampingScrollPhysics(),
            // Add the app bar and list of items as slivers in the next steps.
            slivers: <Widget>[
              SliverAppBar(
                elevation: 0.0,
                floating: false,
                backgroundColor: themeColor,
                title: Center(child: standardHeaderTitle()),
                // bottom: HomePageLandingSlideshowPane(),
                actions: [standardChartIconButton()],
              ),
              SliverToBoxAdapter(child: HomePageLandingSlideshowPane()),
              // SliverPersistentHeader(
              //   pinned: true,
              //   delegate: HomePagePersistentSearchHeader(key: dataKey),
              // ),
              SliverList(
                // Use a delegate to build items as they're scrolled on screen.
                delegate: SliverChildListDelegate(
                  [
                    HomePageRecommendationPane(),
                    HomePageMyDiaryPane(),
                    HomePageNutrientIntakePane(),
                    HomePageNutritionistPane(),
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
