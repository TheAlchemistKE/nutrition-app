import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/dimensions.dart';

class ProfilePageBodyPageBottomButton extends StatelessWidget {
  final Function onPressed;

  const ProfilePageBodyPageBottomButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width,
        constraints: BoxConstraints(maxWidth: buttonMaxWidth),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ElevatedButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(clF47458),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(color: clF47458),
              ),
            ),
          ),
          onPressed: () => onPressed(),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              AppLocalizations.of(context)!.continueText.toUpperCase(),
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
