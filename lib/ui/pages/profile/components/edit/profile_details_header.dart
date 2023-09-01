import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';

class ProfileDetailsHeader extends StatelessWidget {
  final String text;

  const ProfileDetailsHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: themeColor,
            ),
      ),
    );
  }
}

class ProfileDetailsHeaderBody extends StatelessWidget {
  final String text;

  const ProfileDetailsHeaderBody({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: themeColor,
            ),
      ),
    );
  }
}
