import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/models/recommendation/recommendation_model.dart';
import 'package:nutrinowapp/provider/account/account_provider.dart';
import 'package:nutrinowapp/service/recommendation/recommendation_service.dart';
import 'package:nutrinowapp/ui/pages/recommendation/components/recommendation_list_item.dart';
import 'package:nutrinowapp/ui/pages/recommendation/loader/recommendation_grid_list_loader.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';
import 'package:nutrinowapp/ui/widgets/modal_dialog.dart';
import 'package:nutrinowapp/ui/widgets/sliver_delegate.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RecommendationPublic extends StatelessWidget {
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
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Center(child: standardHeaderTitle()),
              actions: [standardChartIconButton()],
            ),
            body: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverDelegate(
                    child: RecommendationPublicTitle(),
                    maxHeight: 56.0,
                    minHeight: 56.0,
                  ),
                ),
                SliverList(
                  // Use a delegate to build items as they're scrolled on screen.
                  delegate: SliverChildListDelegate(
                    [
                      RecommendationPublicList(),
                    ],
                  ),
                ),
              ],
            )
            // body: RecommendationPublicList(),
            ),
      ),
    );
  }
}

class RecommendationPublicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var account = Provider.of<AccountProvider>(context, listen: true);

    var size = MediaQuery.of(context).size;
    var cardWidth = goldenRatioLarge(size.width);
    return Container(
      child: CustomFutureBuilder(
        source: RecommendationService.fetchPublicRecommendations(
            account.defaultProfile),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!(snapshot.data is List<dynamic>) ||
              !snapshot.hasData ||
              snapshot.data.length < 1) {
            return Container();
          }

          return gridView(context, snapshot.data);
        },
        loader: RecommendationGridListLoader(cardWidth: cardWidth),
        errorHandler: (error) => RecommendationGridListLoader(
          cardWidth: cardWidth,
        ),
      ),
    );
  }

  Widget gridView(
      BuildContext context, List<RecommendationModel> recommendations) {
    var size = MediaQuery.of(context).size;
    var cardWidth = goldenRatioLarge(size.width);
    var imgSize = goldenRatioLarge(cardWidth);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GridView.extent(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        maxCrossAxisExtent: cardWidth,
        childAspectRatio: 0.65,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: [
          for (var item in (recommendations))
            RecommendationListItem(
              item,
              cardWidth: cardWidth,
              imgSize: imgSize,
            ),
        ],
      ),
    );
  }
}

class RecommendationPublicTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(color: themeColor),
      child: Text(
        'Recommendations',
        style: Theme.of(context).textTheme.headline5!.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}

void openRecommendationPublic(BuildContext context) {
  ModalDialog.showDialogWidget(
    context,
    RecommendationPublic(),
  );
}
