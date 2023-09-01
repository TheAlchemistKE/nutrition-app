import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nutrinowapp/models/profile/profile_health_condition_model.dart';
import 'package:nutrinowapp/provider/account/profile_setup_provider.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/profile_details_header.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/step4/profile_step4_conditions.dart';
import 'package:provider/provider.dart';

class ProfileStepFour extends StatelessWidget {
  const ProfileStepFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profile = Provider.of<ProfileSetupProvider>(context, listen: true);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ProfileDetailsHeader(
              text: AppLocalizations.of(context)!
                  .profileDetailsHeaderPreCondition,
            ),
            ProfileDetailsHeaderBody(
              text: AppLocalizations.of(context)!
                  .profileDetailsHeaderPreConditionBody,
            ),
            SizedBox(height: 20),
            Container(
              child: ProfileStepFourConditions(
                selectedItems: profile.preExistingConditions,
                onSaved: (List<ProfileHealthConditionModel>? items) {
                  profile.preExistingConditions = items!;
                },
                onChanged: (List<ProfileHealthConditionModel>? items) {
                  profile.preExistingConditions = items!;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
