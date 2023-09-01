import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nutrinowapp/app/routes.dart';
import 'package:nutrinowapp/constants/colors.dart';

class RegistrationNoAccount extends StatelessWidget {
  const RegistrationNoAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.registrationNoAccount,
          style: TextStyle(fontSize: 16.0, color: cl9EB0B5),
        ),
        GestureDetector(
          onTap: () => navigateTo(context, NutriNowRoutes.signupPage),
          child: Text(
            AppLocalizations.of(context)!.registrationNoAccountRegisterNow,
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
