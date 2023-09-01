import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nutrinowapp/app/routes.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/dimensions.dart';
import 'package:nutrinowapp/constants/strings.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: themeColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: themeColor,
          body: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: Center(
                    child: Text(
                      appDisplayName,
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),

                // Image
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Image.asset('assets/images/welcome.png'),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.welcome,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(height: 15),
                      Text(
                        AppLocalizations.of(context)!.welcomeDescription,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: clA2B3B7, fontSize: 17),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(maxWidth: buttonMaxWidth),
                        // margin: EdgeInsets.symmetric(horizontal: 40),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(clF47458),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                                side: BorderSide(color: clF47458),
                              ),
                            ),
                          ),
                          onPressed: () => navigateTo(
                              context, NutriNowRoutes.verifyPhoneNumPage),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            child: Text(
                              AppLocalizations.of(context)!.login,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(maxWidth: buttonMaxWidth),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(themeColor),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                                side: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                          onPressed: () =>
                              navigateTo(context, NutriNowRoutes.signupPage),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            child: Text(
                              AppLocalizations.of(context)!
                                  .register
                                  .toUpperCase(),
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
