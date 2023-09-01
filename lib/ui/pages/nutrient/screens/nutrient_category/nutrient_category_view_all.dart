import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/ui/widgets/modal_dialog.dart';

class NutrientCategoryViewAll extends StatelessWidget {
  const NutrientCategoryViewAll({Key? key}) : super(key: key);

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
          appBar: AppBar(
            leading: BackButton(),
          ),
        ),
      ),
    );
  }
}

void openNutrientCategoryViewAll(BuildContext context) {
  ModalDialog.showDialogWidget(context, NutrientCategoryViewAll());
}
