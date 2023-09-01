import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:nutrinowapp/app/routes.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/dimensions.dart';
import 'package:nutrinowapp/ui/widgets/registration_no_account.dart';

class VerifyPhoneNumPage extends StatelessWidget {
  const VerifyPhoneNumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var number = PhoneNumber(isoCode: 'KE');

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: themeColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: themeColor,
          appBar: AppBar(
              elevation: 0, leading: BackButton(), backgroundColor: themeColor),
          body: SingleChildScrollView(
            child: IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(height: 25),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          AppLocalizations.of(context)!
                              .verifyPhoneNumTitle
                              .toUpperCase(),
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    color: Colors.white,
                                    fontSize: 36,
                                  ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .verifyPhoneNumDescription,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: clD5DDDE),
                            ),
                            SizedBox(height: 30),
                            Text(
                              AppLocalizations.of(context)!
                                  .verifyPhoneNumMobileNumber,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: cl9EB0B5,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            SizedBox(height: 6),
                            Container(
                              constraints: BoxConstraints(maxWidth: 400),
                              child: InternationalPhoneNumberInput(
                                onInputChanged: (PhoneNumber number) =>
                                    print(number.phoneNumber),
                                onInputValidated: (bool value) => print(value),
                                selectorConfig: SelectorConfig(
                                  setSelectorButtonAsPrefixIcon: true,
                                  showFlags: true,
                                  selectorType: PhoneInputSelectorType.DIALOG,
                                ),
                                ignoreBlank: false,
                                autoValidateMode:
                                    AutovalidateMode.onUserInteraction,
                                selectorTextStyle:
                                    TextStyle(color: Colors.black),
                                initialValue: number,
                                formatInput: true,
                                keyboardType: TextInputType.numberWithOptions(
                                  signed: true,
                                  decimal: true,
                                ),
                                inputBorder: OutlineInputBorder(),
                                inputDecoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                onSaved: (PhoneNumber number) =>
                                    print('On Saved: $number'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Bottom button
                    Expanded(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              constraints:
                                  BoxConstraints(maxWidth: buttonMaxWidth),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.white,
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    clF47458,
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                      side: BorderSide(color: clF47458),
                                    ),
                                  ),
                                ),
                                onPressed: () => navigateTo(
                                  context,
                                  NutriNowRoutes.verifyOtpPage,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .login
                                        .toUpperCase(),
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            RegistrationNoAccount(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
