import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nutrinowapp/provider/account/profile_setup_provider.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/profile_details_header.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/step3/profile_step3_height.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/step3/profile_step3_level_of_activity.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/step3/profile_step3_weight.dart';
import 'package:provider/provider.dart';

typedef FunctionValue = Function(dynamic);

class ProfileStepThree extends StatelessWidget {
  const ProfileStepThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profile = Provider.of<ProfileSetupProvider>(context, listen: true);

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProfileDetailsHeader(
              text: AppLocalizations.of(context)!.profileDetailsHeaderGeneric,
            ),
            ProfileDetailsHeaderBody(
              text:
                  AppLocalizations.of(context)!.profileDetailsHeaderGenericBody,
            ),
            SizedBox(height: 20),
            ProfileStepThreeWeight(
              initialVal: profile.weight,
              initialMetricVal: profile.weightMetric,
              onChanged: (value) =>
                  profile.weight = double.tryParse(value) ?? 0,
              onMetricChanged: (value) => profile.weightMetric = value.value,
            ),
            SizedBox(height: 20),
            ProfileStepThreeHeight(
              initialVal: profile.height,
              initialMetricVal: profile.heightMetric,
              onChanged: (value) =>
                  profile.height = double.tryParse(value) ?? 0,
              onMetricChanged: (value) => profile.heightMetric = value.value,
            ),
            SizedBox(height: 20),
            ProfileStepThreeLevelOfActivity(
              initialValue: profile.levelOfActivityId,
              onChanged: (value) => profile.levelOfActivityId = value!.id,
            ),
          ],
        ),
      ),
    );
  }
}
