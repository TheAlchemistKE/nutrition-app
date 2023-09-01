import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/provider/account/account_provider.dart';
import 'package:nutrinowapp/service/nutritionist/nutritionist_service.dart';
import 'package:nutrinowapp/ui/pages/home/component/nutritionist/home_page_nutritionist_pane_list.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';
import 'package:provider/provider.dart';

class HomePageNutritionistPane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'View nutritionists',
                style: TextStyle(
                  color: themeColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              Spacer(),
              Text('View all'),
            ],
          ),
          SizedBox(height: 10),
          customFutureBuilderNutritionistPaneList(context),
        ],
      ),
    );
  }

  Widget customFutureBuilderNutritionistPaneList(BuildContext context) {
    var account = Provider.of<AccountProvider>(context, listen: true);
    return Container(
      child: CustomFutureBuilder(
        source: NutritionistService.fetchProfileNutritionists(
            account.defaultProfile),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!(snapshot.data is List<dynamic>) ||
              !snapshot.hasData ||
              snapshot.data.length < 1) {
            return Container();
          }

          return HomePageNutritionistPaneList(nutritionists: snapshot.data);
        },
        loader: HomePageNutritionistPaneListLoader(),
        errorHandler: (error) => HomePageNutritionistPaneListLoader(),
      ),
    );
  }
}
