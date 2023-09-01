import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nutrinowapp/app/routes.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/dimensions.dart';
import 'package:nutrinowapp/constants/strings.dart';

class SignupTacConfirmPage extends StatefulWidget {
  const SignupTacConfirmPage({Key? key}) : super(key: key);

  @override
  _SignupTacConfirmPageState createState() => _SignupTacConfirmPageState();
}

class _SignupTacConfirmPageState extends State<SignupTacConfirmPage> {
  bool isTACAccepted = false;

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
          appBar: AppBar(
            elevation: 0,
            leading: BackButton(),
            backgroundColor: themeColor,
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // app name
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      appDisplayName,
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),

                Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.signupTacDescription,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: clCCD5D8, fontSize: 16),
                    ),
                  ),
                ),

                // Terms and condition license
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () =>
                          navigateTo(context, NutriNowRoutes.signupTacPage),
                      child: Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: clCCD5D8, width: 1.0),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.signupTacClickToView,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: clCCD5D8,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(color: cl295663),
                        child: Align(
                          alignment: Alignment.center,
                          child: Theme(
                            data: ThemeData.light().copyWith(
                              toggleableActiveColor: Colors.white,
                              unselectedWidgetColor: Colors.white,
                            ),
                            child: Checkbox(
                              fillColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                              checkColor: themeColor,
                              onChanged: (bool? value) {
                                setState(() => isTACAccepted = value!);
                              },
                              value: isTACAccepted,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(color: Colors.white),
                          child: Text(
                            AppLocalizations.of(context)!.signupTacAccept,
                            style: TextStyle(color: themeColor, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      constraints: BoxConstraints(maxWidth: buttonMaxWidth),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white,
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            isTACAccepted ? clF47458 : Colors.grey.shade500,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: BorderSide(
                                color: isTACAccepted
                                    ? clF47458
                                    : Colors.grey.shade500,
                              ),
                            ),
                          ),
                        ),
                        onPressed: isTACAccepted
                            ? () => navigateTo(context, NutriNowRoutes.homePage)
                            : null,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 18),
                          child: Text(
                            AppLocalizations.of(context)!.finish,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
