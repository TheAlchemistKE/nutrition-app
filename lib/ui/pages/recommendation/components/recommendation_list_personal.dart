import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/dimensions.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/models/profile/profile_recommendation_model.dart';
import 'package:nutrinowapp/provider/account/account_provider.dart';
import 'package:nutrinowapp/service/recommendation/recommendation_service.dart';
import 'package:nutrinowapp/ui/pages/recommendation/components/recommendation_list_item.dart';
import 'package:nutrinowapp/ui/pages/recommendation/loader/recommendation_list_item_loader.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';
import 'package:nutrinowapp/ui/widgets/shimmer.dart';
import 'package:provider/provider.dart';

class RecommendationListPersonalTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Text(
        'My Recommendations',
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: Colors.white,
              fontSize: 18,
            ),
      ),
    );
  }
}

class RecommendationListPersonal extends StatelessWidget {
  const RecommendationListPersonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var account = Provider.of<AccountProvider>(context, listen: true);
    return Container(
      child: CustomFutureBuilder(
        source: RecommendationService.fetchProfileRecommendations(
          account.defaultProfile!,
        ),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!(snapshot.data is List<dynamic>) ||
              !snapshot.hasData ||
              snapshot.data.length < 1) {
            return Container();
          }
          return listView(context, snapshot.data);
        },
        loader: RecommendationListPersonalLoader(),
        errorHandler: (error) => RecommendationListPersonalLoader(),
      ),
    );
  }

  Widget listView(
      BuildContext context, List<ProfileRecommendationModel> items) {
    var size = MediaQuery.of(context).size;
    var cardWidth = idealSize(
      goldenRatioLarge(size.width) * 0.85,
      kMinWidthPane,
      kMaxWidthPane,
    );

    return Container(
      constraints: BoxConstraints(
        minHeight: cardWidth * 1.2,
        maxHeight: cardWidth * 1.5,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var item = items[index];
          return RecommendationListItem(
            item.recommendation,
            cardWidth: cardWidth,
            imgSize: cardWidth,
          );
        },
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) {
          return Container(width: 15);
        },
      ),
    );
  }
}

class RecommendationListPersonalLoader extends StatelessWidget {
  final int length;

  const RecommendationListPersonalLoader({Key? key, this.length = 4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardWidth = idealSize(
      goldenRatioLarge(size.width) * 0.85,
      kMinWidthPane,
      kMaxWidthPane,
    );

    return Shimmer(
      child: Container(
        constraints: BoxConstraints(
          minHeight: cardWidth * 1.2,
          maxHeight: cardWidth * 1.5,
        ),
        height: goldenRatioSumFromLarge(cardWidth),
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return RecommendationListItemLoader(
              cardWidth: cardWidth,
            );
          },
          itemCount: length,
          separatorBuilder: (BuildContext context, int index) {
            return Container(width: 15);
          },
        ),
      ),
    );
  }
}
