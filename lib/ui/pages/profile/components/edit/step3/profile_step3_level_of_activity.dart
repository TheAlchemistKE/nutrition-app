import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nutrinowapp/helper/utility.dart';
import 'package:nutrinowapp/models/app/level_of_activity_model.dart';
import 'package:nutrinowapp/service/profile/profile_onboarding_service.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';

typedef _FunctionLevelOfActivity = Function(LevelOfActivityModel?);

class ProfileStepThreeLevelOfActivity extends StatelessWidget {
  final int initialValue;
  final _FunctionLevelOfActivity onChanged;

  const ProfileStepThreeLevelOfActivity({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomFutureBuilder(
        source: ProfileOnBoardingService.fetchLevelOfActivity(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!(snapshot.data is List<dynamic>) ||
              !snapshot.hasData ||
              snapshot.data.length < 1) {
            return CircularProgressIndicator();
          }
          return _dropDownMenu(context, snapshot.data);
        },
        loader: CircularProgressIndicator(),
        errorHandler: (error) => CircularProgressIndicator(),
      ),
    );
  }

  Widget _dropDownMenu(BuildContext context, List<LevelOfActivityModel> items) {
    return Container(
      alignment: Alignment.centerRight,
      child: DropdownButtonFormField<LevelOfActivityModel>(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          filled: false,
          labelText: AppLocalizations.of(context)!.signupLevelOfActivityLabel,
          hintText: AppLocalizations.of(context)!.signupLevelOfActivityHint,
        ),
        isExpanded: true,
        value: firstWhere(
          items,
          (elem) {
            if (initialValue == 0) return elem.isDefault;
            return elem.id == initialValue;
          },
        ),
        items: items.map((LevelOfActivityModel value) {
          return DropdownMenuItem<LevelOfActivityModel>(
            value: value,
            child: Text(value.name),
          );
        }).toList(),
        onChanged: onChanged,
        onSaved: onChanged,
      ),
    );
  }
}
