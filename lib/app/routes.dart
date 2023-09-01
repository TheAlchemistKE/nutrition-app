import 'package:flutter/cupertino.dart';
import 'package:nutrinowapp/provider/account/account_provider.dart';
import 'package:nutrinowapp/ui/pages/diary/diary_page.dart';
import 'package:nutrinowapp/ui/pages/food/food_page.dart';
import 'package:nutrinowapp/ui/pages/help/help_page.dart';
import 'package:nutrinowapp/ui/pages/home/home_page.dart';
import 'package:nutrinowapp/ui/pages/landing/landing_page.dart';
import 'package:nutrinowapp/ui/pages/onboarding/onboarding_page.dart';
import 'package:nutrinowapp/ui/pages/otp/verify_otp_page.dart';
import 'package:nutrinowapp/ui/pages/profile/profiles_list_page.dart';
import 'package:nutrinowapp/ui/pages/recommendation/recommendations_page.dart';
import 'package:nutrinowapp/ui/pages/settings/settings_page.dart';
import 'package:nutrinowapp/ui/pages/signup/signup_page.dart';
import 'package:nutrinowapp/ui/pages/signup/signup_tac_confirm_page.dart';
import 'package:nutrinowapp/ui/pages/signup/signup_tac_page.dart';
import 'package:nutrinowapp/ui/pages/welcome/verify_pnum_page.dart';
import 'package:nutrinowapp/ui/pages/welcome/welcome_page.dart';
import 'package:provider/provider.dart';

var routes = {
  NutriNowRoutes.landingPage: (ctx) => LandingPage(),
  NutriNowRoutes.onBoardingPage: (ctx) => OnBoardingPage(),
  NutriNowRoutes.welcomePage: (ctx) => WelcomePage(),
  NutriNowRoutes.verifyPhoneNumPage: (ctx) => VerifyPhoneNumPage(),
  NutriNowRoutes.signupPage: (ctx) => SignupPage(),
  NutriNowRoutes.signupTacPage: (ctx) => SignupTacPage(),
  NutriNowRoutes.signupTacConfirmPage: (ctx) => SignupTacConfirmPage(),
  NutriNowRoutes.verifyOtpPage: (ctx) => VerifyOtpPage(),

  // required default profile
  NutriNowRoutes.homePage: (ctx) => SessionRoute(ctx, HomePage()),
  NutriNowRoutes.diaryPage: (ctx) => SessionRoute(ctx, DiaryPage()),
  NutriNowRoutes.recommendPage: (ctx) =>
      SessionRoute(ctx, RecommendationsPage()),
  NutriNowRoutes.manageProfilesPage: (ctx) =>
      SessionRoute(ctx, ProfileListPage()),
  NutriNowRoutes.foodPage: (ctx) => SessionRoute(ctx, FoodPage()),
  NutriNowRoutes.settingsPage: (ctx) => SessionRoute(ctx, SettingsPage()),
  NutriNowRoutes.helpPage: (ctx) => SessionRoute(ctx, HelpPage()),
};

class NutriNowRoutes {
  static const landingPage = '/landing';
  static const onBoardingPage = '/on-boarding';
  static const welcomePage = '/welcome';
  static const verifyPhoneNumPage = '/verify-phone-num';
  static const signupPage = '/signup';
  static const signupTacPage = '/signup-tac';
  static const signupTacConfirmPage = '/signup-tac-confirm';
  static const verifyOtpPage = '/verify-otp';
  static const homePage = '/home';
  static const diaryPage = '/diary';
  static const recommendPage = '/recommend';
  static const manageProfilesPage = '/manage-profiles';
  static const foodPage = '/food';
  static const settingsPage = '/settings';
  static const helpPage = '/help';
}

Widget SessionRoute(BuildContext context, Widget page) {
  var account = Provider.of<AccountProvider>(context, listen: true);
  if (account.defaultProfile == null) {
    return OnBoardingPage();
  }
  return page;
}

String? initialRoute(BuildContext context) {
  var account = Provider.of<AccountProvider>(context, listen: true);
  if (account.defaultProfile == null) {
    return NutriNowRoutes.onBoardingPage;
  }
  return NutriNowRoutes.homePage;
}

void navigateTo(BuildContext context, String route) {
  Navigator.pushNamed(context, route);
}
