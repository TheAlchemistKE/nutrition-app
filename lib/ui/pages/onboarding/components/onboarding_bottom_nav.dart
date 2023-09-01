import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nutrinowapp/app/routes.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/dimensions.dart';

class OnBoardingBottomButtons extends StatelessWidget {
  final int currentIndex;
  final int dataLength;
  final PageController controller;

  const OnBoardingBottomButtons(
      {Key? key,
      required this.currentIndex,
      required this.dataLength,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (currentIndex == dataLength - 1) {
      return Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: 70.0,
          maxWidth: buttonMaxWidth,
        ),
        child: TextButton(
          onPressed: () => navigateTo(context, NutriNowRoutes.welcomePage),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 18),
            ),
            backgroundColor: MaterialStateProperty.all(themeColor),
            shape: MaterialStateProperty.all<StadiumBorder>(
              StadiumBorder(side: BorderSide.none),
            ),
          ),
          child: Text(
            AppLocalizations.of(context)!.getStarted,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => navigateTo(context, NutriNowRoutes.welcomePage),
          child: Text(
            AppLocalizations.of(context)!.skip,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Colors.grey.shade600),
          ),
        ),
        CircleAvatar(
          backgroundColor: themeColor,
          radius: 24,
          child: IconButton(
            color: themeColor,
            icon: Icon(Icons.arrow_forward, color: Colors.white),
            iconSize: 24,
            onPressed: () {
              controller.nextPage(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut);
            },
          ),
        ),
      ],
    );
  }
}
