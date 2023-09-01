import 'package:flutter/material.dart';
import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/models/recommendation/recommendation_model.dart';
import 'package:nutrinowapp/provider/account/account_provider.dart';
import 'package:nutrinowapp/ui/pages/recommendation/components/recommendation_goal_progress_salutation.dart';
import 'package:nutrinowapp/ui/pages/recommendation/components/recommendation_progress_goal_button.dart';
import 'package:nutrinowapp/ui/pages/recommendation/components/recommendations_goal_progress_tabs.dart';
import 'package:nutrinowapp/ui/pages/recommendation/screens/progress/recommendation_progress_body_month.dart';
import 'package:nutrinowapp/ui/pages/recommendation/screens/progress/recommendation_progress_body_week.dart';
import 'package:nutrinowapp/ui/pages/recommendation/screens/progress/recommendation_progress_body_year.dart';
import 'package:provider/provider.dart';

class RecommendationProgressBody extends StatefulWidget {
  final RecommendationModel recommendationModel;

  const RecommendationProgressBody(
      {Key? key, required this.recommendationModel})
      : super(key: key);

  @override
  _RecommendationGoalsBodyState createState() =>
      _RecommendationGoalsBodyState();
}

class _RecommendationGoalsBodyState extends State<RecommendationProgressBody> {
  @override
  Widget build(BuildContext context) {
    var account = Provider.of<AccountProvider>(context, listen: true);
    var size = MediaQuery.of(context).size;
    var tabWidth = size.width / 3;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.only(top: 20, left: 40, right: 40),
      child: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
                ),
                sliver: SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  floating: true,
                  pinned: true,
                  snap: true,
                  expandedHeight: 160,
                  forceElevated: innerBoxIsScrolled,
                  flexibleSpace: FlexibleSpaceBar(
                    // centerTitle: true,
                    background: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RecommendationGoalProgressSalutation(
                          name: account
                              .defaultProfile!.fName.capitalizeFirstOfEach,
                        ),
                        SizedBox(height: 25),
                        RecommendationProgressGoalButtons(
                          recommendationModel: widget.recommendationModel,
                          trackProgressIsActive: true,
                          viewGoalsIsActive: false,
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                  bottom: recommendationGoalProgressTabs(context, tabWidth),
                ),
              ),
            ];
          },
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              RecommendationProgressBodyWeek(),
              RecommendationProgressBodyMonth(),
              RecommendationProgressBodyYear(),
            ].map((e) {
              return Builder(
                builder: (BuildContext context) {
                  return CustomScrollView(
                    key: PageStorageKey<String>(e.toStringShort()),
                    slivers: [
                      SliverOverlapInjector(
                        // This is the flip side of the SliverOverlapAbsorber
                        // above.
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context,
                        ),
                      ),
                      SliverFillRemaining(child: e),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
