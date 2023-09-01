import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/provider/account/account_provider.dart';
import 'package:nutrinowapp/service/recommendation/recommendation_service.dart';
import 'package:nutrinowapp/ui/pages/home/component/recommendation/home_page_recommendation_pane_list.dart';
import 'package:nutrinowapp/ui/pages/recommendation/screens/recommendation_public.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';
import 'package:provider/provider.dart';

class HomePageRecommendationPane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => openRecommendationPublic(context),
            // onTap: () => openRecommendationDetail(context, recommendData[0]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recommendations',
                  style: TextStyle(
                    color: themeColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),

                // Spacer(),
                Text('View all'),
              ],
            ),
          ),
          SizedBox(height: 10),
          customFutureBuilderRecommendationList(context),
        ],
      ),
    );
  }

  Widget customFutureBuilderRecommendationList(BuildContext context) {
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

          return HomePageRecommendationPaneList(recommendations: snapshot.data);
        },
        loader: HomePageRecommendationPaneListLoader(),
        errorHandler: (error) => HomePageRecommendationPaneListLoader(),
      ),
    );
  }
}
