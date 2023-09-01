import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/models/diary/diary_kind_model.dart';
import 'package:nutrinowapp/provider/application/application_provider.dart';
import 'package:nutrinowapp/ui/pages/diary/components/diary_categories.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/food/food_diary_page.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/generic/generic_diary_page.dart';
import 'package:nutrinowapp/ui/widgets/modal_dialog.dart';
import 'package:nutrinowapp/ui/widgets/page_footer.dart';
import 'package:provider/provider.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({Key? key}) : super(key: key);

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
          backgroundColor: themeColor,
          body: CustomScrollView(
            physics: BouncingScrollPhysics(),
            // Add the app bar and list of items as slivers in the next steps.
            slivers: <Widget>[
              SliverList(
                // Use a delegate to build items as they're scrolled on screen.
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'My Diaries',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 35),
                          DiaryCategories(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: PageFooter(currentIndex: 1),
        ),
      ),
    );
  }
}

void openDiaryScreen(BuildContext context, DiaryKindModel diaryModel) {
  switch (diaryModel.type) {
    case DiaryKindModelType.food:
      ModalDialog.showDialogWidget(context, FoodDiaryPage(diaryModel));
      break;
    case DiaryKindModelType.generic:
    default:
      ModalDialog.showDialogWidget(context, GenericDiaryPage(diaryModel));
  }
}
