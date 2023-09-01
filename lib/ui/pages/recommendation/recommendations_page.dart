import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/provider/application/application_provider.dart';
import 'package:nutrinowapp/ui/pages/recommendation/components/recommendation_list_personal.dart';
import 'package:nutrinowapp/ui/pages/recommendation/components/recommendation_list_suggested.dart';
import 'package:nutrinowapp/ui/pages/recommendation/screens/recommendation_public.dart';
import 'package:nutrinowapp/ui/widgets/page_footer.dart';
import 'package:nutrinowapp/ui/widgets/sliver_delegate.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RecommendationsPage extends StatelessWidget {
  const RecommendationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: themeColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: themeColor,
          appBar: AppBar(
            leading: Container(),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Center(child: standardHeaderTitle()),
            actions: [
              IconButton(
                icon: Icon(Icons.public, color: Colors.white),
                onPressed: () => openRecommendationPublic(context),
              ),
            ],
          ),
          body: RecommendationsPageContent(),
          bottomNavigationBar: PageFooter(currentIndex: 2),
        ),
      ),
    );
  }
}

class RecommendationsPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ApplicationProvider>(context, listen: true)
        .displayConnectionChangeSnackBar(context);

    return Container(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverDelegate(
              child: RecommendationTitle(),
              maxHeight: 56.0,
              minHeight: 56.0,
            ),
          ),
          SliverList(
            // Use a delegate to build items as they're scrolled on screen.
            delegate: SliverChildListDelegate(
              [
                RecommendationListPersonalTitle(),
                RecommendationListPersonal(),
                RecommendationListSuggested(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecommendationTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.0,
      decoration: BoxDecoration(color: themeColor),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Text(
        'Recommendations',
        style: Theme.of(context).textTheme.headline5!.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
