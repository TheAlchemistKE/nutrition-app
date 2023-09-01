import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/fonts.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_model.dart';
import 'package:nutrinowapp/ui/pages/nutrient/screens/nutrient_details/nutrient_details_about.dart';
import 'package:nutrinowapp/ui/pages/nutrient/screens/nutrient_details/nutrient_details_caution.dart';
import 'package:nutrinowapp/ui/pages/nutrient/screens/nutrient_details/nutrient_details_foods.dart';
import 'package:nutrinowapp/ui/widgets/modal_dialog.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class NutrientDetails extends StatelessWidget {
  final NutrientModel nutrientModel;

  const NutrientDetails(this.nutrientModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var headerHeight =
        max(220.0, goldenRatioLarge(min(size.height, size.width)));

    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                backgroundColor: themeColor,
                expandedHeight: headerHeight,
                leading: BackButton(),
                elevation: 0.0,
                floating: true,
                pinned: false,
                actions: [
                  IconButton(
                    icon: Icon(Icons.chat, color: Colors.white),
                    onPressed: () => print('clicked chat'),
                  ),
                ],
                title: Center(child: standardHeaderTitle()),
                centerTitle: true,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(130),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        AutoSizeText(
                          nutrientModel.name,
                          textAlign: TextAlign.center,
                          style: roboto(
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.white, fontSize: 32),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            // horizontal: 40,
                            vertical: 20,
                          ),
                          child: Text(
                            nutrientModel.description,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: kreon(
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: themeColor,
                    unselectedLabelColor: Colors.grey,
                    unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                    indicator: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(width: 4.0, color: clF47458),
                      ),
                    ),
                    tabs: [
                      Tab(text: 'About'.toUpperCase()),
                      Tab(text: 'Caution'.toUpperCase()),
                      Tab(text: 'Food'.toUpperCase()),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              NutrientDetailsAbout(nutrientModel),
              NutrientDetailsCaution(nutrientModel),
              NutrientDetailsFoods(nutrientModel),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: clEEEEEE, child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

void openNutrientDetails(BuildContext context, NutrientModel nutrientModel) {
  ModalDialog.showDialogWidget(context, NutrientDetails(nutrientModel));
}
