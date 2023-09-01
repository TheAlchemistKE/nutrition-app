import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/models/profile/profile_model.dart';
import 'package:nutrinowapp/provider/account/profile_setup_provider.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/profile_details_header.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/step2/profile_step2_gender.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/step2/profile_step2_physiological_status.dart';
import 'package:provider/provider.dart';

class ProfileStepTwo extends StatelessWidget {
  final double maxSize = 300.0;

  const ProfileStepTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profile = Provider.of<ProfileSetupProvider>(context, listen: true);

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: <Widget>[
            ProfileDetailsHeader(
              text: AppLocalizations.of(context)!.profileDetailsHeaderGeneric,
            ),
            ProfileDetailsHeaderBody(
              text:
                  AppLocalizations.of(context)!.profileDetailsHeaderGenericBody,
            ),

            ProfileStepTwoGender(
              initialValue: profile.gender,
              validator: (value) {
                if (profile.gender.equal(ProfileGender.UnKnown) &&
                    (value == null || value.equal(ProfileGender.UnKnown))) {
                  return 'Please select your gender';
                }
              },
              maxSize: maxSize,
              onChanged: (ProfileGender value) => profile.gender = value,
            ),

            SizedBox(height: 30),

            // Physiological status
            if (profile.gender.equal(ProfileGender.Female))
              ProfileStepTwoPhysiologicalStatus(
                initialValue: profile.physiologicalStatusId,
                onChanged: (value) => profile.physiologicalStatusId = value!.id,
              ),
          ],
        ),
      ),
    );
  }
}
