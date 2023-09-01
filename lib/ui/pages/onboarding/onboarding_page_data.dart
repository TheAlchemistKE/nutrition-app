import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nutrinowapp/models/app/onboarding_model.dart';

List<OnBoardingDetails> onBoardingPageData(BuildContext context) => [
      OnBoardingDetails(
        title: AppLocalizations.of(context)!.onBoardingDetailsTitle1,
        description:
            AppLocalizations.of(context)!.onBoardingDetailsDescription1,
        imageSrc: 'assets/images/onboarding_step1.png',
      ),
      OnBoardingDetails(
        title: AppLocalizations.of(context)!.onBoardingDetailsTitle2,
        description:
            AppLocalizations.of(context)!.onBoardingDetailsDescription2,
        imageSrc: 'assets/images/onboarding_step2.png',
      ),
      OnBoardingDetails(
        title: AppLocalizations.of(context)!.onBoardingDetailsTitle3,
        description:
            AppLocalizations.of(context)!.onBoardingDetailsDescription3,
        imageSrc: 'assets/images/onboarding_step3.png',
      ),
    ];
