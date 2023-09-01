import 'package:flutter/material.dart';
import 'package:nutrinowapp/provider/account/account_provider.dart';
import 'package:nutrinowapp/service/recommendation/recommendation_service.dart';
import 'package:nutrinowapp/ui/pages/recommendation/components/recommendation_list_suggested_loader.dart';
import 'package:nutrinowapp/ui/pages/recommendation/components/recommendation_list_suggested_section.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';
import 'package:provider/provider.dart';

class RecommendationListSuggested extends StatelessWidget {
  const RecommendationListSuggested({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var account = Provider.of<AccountProvider>(context, listen: true);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: CustomFutureBuilder(
        source: RecommendationService.fetchSuggestedRecommendations(
          account.defaultProfile!,
        ),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!(snapshot.data is List<dynamic>) ||
              !snapshot.hasData ||
              snapshot.data.length < 1) {
            return Container();
          }

          return Column(
            children: [
              for (var section in snapshot.data)
                RecommendationListSuggestedSection(section: section),
            ],
          );
        },
        loader: RecommendationListSuggestedSectionLoader(),
        errorHandler: (error) => RecommendationListSuggestedSectionLoader(),
      ),
    );
  }
}
