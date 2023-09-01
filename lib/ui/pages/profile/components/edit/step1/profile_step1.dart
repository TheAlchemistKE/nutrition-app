import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:nutrinowapp/provider/account/profile_setup_provider.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/profile_details_header.dart';
import 'package:provider/provider.dart';

class ProfileStepOne extends StatelessWidget {
  const ProfileStepOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profile = Provider.of<ProfileSetupProvider>(context, listen: true);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            ProfileDetailsHeader(
              text: AppLocalizations.of(context)!.profileDetailsHeaderGeneric,
            ),
            ProfileDetailsHeaderBody(
              text:
                  AppLocalizations.of(context)!.profileDetailsHeaderGenericBody,
            ),

            // Full name
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                initialValue: profile.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: AppLocalizations.of(context)!.signupFullNameLabel,
                  hintText: AppLocalizations.of(context)!.signupFullNameHint,
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!
                        .signupFullNameValidatorText;
                  }
                  return null;
                },
                onChanged: (value) => profile.name = value,
              ),
            ),

            // Birthday
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ProfileStepOneDob(
                initialValue: profile.dob,
                onUpdate: (DateTime dob) {
                  profile.dob = dob;
                },
              ),
            ),

            // Location
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              // child: TextFormField(
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: AppLocalizations.of(context)!.signupLocationLabel,
              //     hintText: AppLocalizations.of(context)!.signupLocationHint,
              //     prefixIcon: Icon(Icons.location_on),
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return AppLocalizations.of(context)!
              //           .signupLocationValidatorText;
              //     }
              //     return null;
              //   },
              //   onSaved: (value) {},
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileStepOneDob extends StatefulWidget {
  final DateTime? initialValue;
  final Function onUpdate;

  const ProfileStepOneDob({
    Key? key,
    required this.initialValue,
    required this.onUpdate,
  }) : super(key: key);

  @override
  State<ProfileStepOneDob> createState() => _ProfileStepOneDobState();
}

class _ProfileStepOneDobState extends State<ProfileStepOneDob> {
  TextEditingController dateInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      final formatter = DateFormat('yyyy-MM-dd');
      dateInputController.text = formatter.format(widget.initialValue!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: dateInputController,
      readOnly: true,
      enabled: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: AppLocalizations.of(context)!.signupBirthdayLabel,
        hintText: AppLocalizations.of(context)!.signupBirthdayHint,
        prefixIcon: Icon(Icons.calendar_today),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.signupBirthdayValidatorText;
        }
        return null;
      },
      onTap: () async {
        var dob = await _dobDatePicker(context, widget.initialValue);
        if (dob == null) return;
        final formatter = DateFormat('yyyy-MM-dd');
        dateInputController.text = formatter.format(dob);
        widget.onUpdate(dob);
      },
    );
  }

  Future<DateTime?> _dobDatePicker(
      BuildContext context, DateTime? initialDate) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: initialDate != null && initialDate.isBefore(DateTime.now())
          ? initialDate
          : DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    return selected;
  }
}
