import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nutrinowapp/helper/utility.dart';
import 'package:nutrinowapp/models/app/physiological_status_model.dart';
import 'package:nutrinowapp/service/profile/profile_onboarding_service.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';

typedef _FunctionPhysiologicalStatus = Function(PhysiologicalStatusModel?);

class ProfileStepTwoPhysiologicalStatus extends StatelessWidget {
  final _FunctionPhysiologicalStatus onChanged;
  final int initialValue;

  const ProfileStepTwoPhysiologicalStatus(
      {Key? key, required this.onChanged, required this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomFutureBuilder(
        source: ProfileOnBoardingService.getPhysiologicalStatus(),
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

  Widget _dropDownMenu(
      BuildContext context, List<PhysiologicalStatusModel> items) {
    return Container(
      child: DropdownButtonFormField<PhysiologicalStatusModel>(
        validator: (v) => v == null ? 'required field' : null,
        decoration: InputDecoration(
          filled: false,
          hintText: AppLocalizations.of(context)!.signupPhysiologicalStatusHint,
          labelText:
              AppLocalizations.of(context)!.signupPhysiologicalStatusLabel,
          border: OutlineInputBorder(),
        ),
        isExpanded: true,
        value: firstWhere(
          items,
          (elem) {
            if (initialValue == 0) return elem.isDefault;
            return elem.id == initialValue;
          },
        ),
        items: items.map((value) {
          return DropdownMenuItem<PhysiologicalStatusModel>(
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
