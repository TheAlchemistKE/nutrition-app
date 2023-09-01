import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/models/profile/profile_model.dart';

class ProfileStepTwoGender extends FormField<ProfileGender> {
  final double maxSize;
  final ValueChanged<ProfileGender> onChanged;

  ProfileStepTwoGender({
    Key? key,
    required this.onChanged,
    ProfileGender initialValue = ProfileGender.UnKnown,
    FormFieldSetter<ProfileGender>? onSaved,
    FormFieldValidator<ProfileGender>? validator,
    required this.maxSize,
  }) : super(
          key: key,
          initialValue: initialValue,
          onSaved: onSaved,
          validator: validator,
          enabled: true,
          builder: (FormFieldState<ProfileGender> state) {
            return _ProfileStepTwoGender(
              state,
              onChanged: onChanged,
              maxSize: maxSize,
            );
          },
        );
}

class _ProfileStepTwoGender extends StatelessWidget {
  final FormFieldState<ProfileGender> state;
  final double maxSize;
  final ValueChanged<ProfileGender> onChanged;

  const _ProfileStepTwoGender(this.state,
      {Key? key, required this.maxSize, required this.onChanged})
      : super(key: key);

  void update(ProfileGender gender) {
    print('Gender $gender');
    state.didChange(gender);
    onChanged(gender);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GenderPickerWithImage(
            showOtherGender: false,
            verticalAlignedText: true,
            // maleImage: Image.asset('assets/images/signup_male.png').image,
            // femaleImage: Image.asset('assets/images/signup_female.png').image,
            selectedGender: selectedGender(state.value),
            selectedGenderTextStyle: TextStyle(
              color: themeColor,
              fontSize: 19,
              fontWeight: FontWeight.w600,
            ),
            unSelectedGenderTextStyle: TextStyle(
              fontSize: 19,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            onChanged: (Gender? gender) {
              switch (gender) {
                case Gender.Female:
                  update(ProfileGender.Female);
                  break;
                case Gender.Male:
                  update(ProfileGender.Male);
                  break;
                case Gender.Others:
                default:
                  break;
              }
            },
            equallyAligned: true,
            animationDuration: Duration(milliseconds: 300),
            isCircular: false,
            opacityOfGradient: 0.4,
            linearGradient: LinearGradient(
              colors: [themeColor, themeColor],
              begin: Alignment(-1.0, -0.3),
              end: Alignment(1.0, 0.3),
            ),
            padding: EdgeInsets.zero,
            size: min(
              goldenRatioSmall(MediaQuery.of(context).size.width),
              maxSize + 50,
            ),
          ),
          SizedBox(height: 20),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Other options
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(maxWidth: maxSize),
                      child: ElevatedButton(
                        onPressed: () => update(ProfileGender.Other),
                        style: ElevatedButton.styleFrom(
                          primary: state.value!.equal(ProfileGender.Other)
                              ? cl063E3F
                              : Colors.white,
                          onPrimary: state.value!.equal(ProfileGender.Other)
                              ? Colors.white
                              : cl063E3F,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          side: BorderSide(
                            color: state.value!.equal(ProfileGender.Other)
                                ? cl063E3F
                                : Colors.grey.shade200,
                          ),
                        ),
                        child: Text(AppLocalizations.of(context)!.other),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),

                  // Prefer not to say option
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(maxWidth: maxSize),
                      child: ElevatedButton(
                        onPressed: () => update(ProfileGender.PreferNotToSay),
                        style: ElevatedButton.styleFrom(
                          primary:
                              state.value!.equal(ProfileGender.PreferNotToSay)
                                  ? cl063E3F
                                  : Colors.white,
                          onPrimary:
                              state.value!.equal(ProfileGender.PreferNotToSay)
                                  ? Colors.white
                                  : cl063E3F,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          side: BorderSide(
                            color:
                                state.value!.equal(ProfileGender.PreferNotToSay)
                                    ? cl063E3F
                                    : Colors.grey.shade200,
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.preferNotToSay,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Error
          state.hasError
              ? Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    state.errorText!,
                    style: TextStyle(color: Colors.red),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Gender? selectedGender(ProfileGender? profileGender) {
    switch (profileGender) {
      case ProfileGender.Female:
        return Gender.Female;
      case ProfileGender.Male:
        return Gender.Male;
      default:
        return null;
    }
  }
}
