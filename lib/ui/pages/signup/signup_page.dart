import 'package:flutter/material.dart';
import 'package:nutrinowapp/app/routes.dart';
import 'package:nutrinowapp/models/profile/profile_model.dart';
import 'package:nutrinowapp/provider/account/account_provider.dart';
import 'package:nutrinowapp/service/profile/profile_service.dart';
import 'package:nutrinowapp/ui/pages/profile/profile_page.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var account = Provider.of<AccountProvider>(context, listen: true);
    return ProfilePage(
      onComplete: (ProfileModel profile) async {
        account.defaultProfile = await ProfileService.createNewProfile(profile);
        navigateTo(context, NutriNowRoutes.signupTacConfirmPage);
        return '';
      },
    );
  }
}
