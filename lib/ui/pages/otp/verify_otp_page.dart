import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nutrinowapp/app/routes.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/dimensions.dart';
import 'package:nutrinowapp/ui/widgets/registration_no_account.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var otpCodeInputWidth = (MediaQuery.of(context).size.width - 80 - 15) / 4;
    otpCodeInputWidth = min(otpCodeInputWidth, 100);

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
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          AppLocalizations.of(context)!
                              .otpVerificationCode
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
                                  .otpVerificationCodeDescription,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: clD5DDDE),
                            ),
                            Expanded(child: SizedBox(height: 30)),
                            Text(
                              AppLocalizations.of(context)!.otpOneTimePassCode,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: clD5DDDE,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            SizedBox(height: 6),
                            Container(
                              child: PinCodeTextField(
                                keyboardType: TextInputType.number,
                                onChanged: (String value) {},
                                length: 4,
                                appContext: context,
                                cursorColor: Colors.black,
                                animationDuration: Duration(milliseconds: 300),
                                enableActiveFill: true,
                                pinTheme: PinTheme(
                                  fieldWidth: otpCodeInputWidth,
                                  fieldHeight: otpCodeInputWidth - 10,
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(5),
                                  activeFillColor: Colors.white,
                                  activeColor: themeColor,
                                  inactiveColor: themeColor,
                                  selectedFillColor: Colors.white,
                                  inactiveFillColor: Colors.white,
                                  selectedColor: themeColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Bottom button
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomCenter,
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
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          clF47458),
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
                                  NutriNowRoutes.homePage,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .verify
                                        .toUpperCase(),
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 35),
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
