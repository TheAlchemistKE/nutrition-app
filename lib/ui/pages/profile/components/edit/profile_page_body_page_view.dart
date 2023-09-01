import 'package:flutter/material.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/step1/profile_step1.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/step2/profile_step2.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/step3/profile_step3.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/step4/profile_step4.dart';

typedef ProfilePageBodyOnPageChanged = Function(int);

class ProfilePageBodyPageView extends StatelessWidget {
  final PageController controller;
  final ProfilePageBodyOnPageChanged onPageChanged;

  const ProfilePageBodyPageView(
      {Key? key, required this.controller, required this.onPageChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      onPageChanged: onPageChanged,
      itemBuilder: (BuildContext context, int index) {
        return _page(index);
      },
    );
  }

  Widget _page(int index) {
    final pages = <Widget>[
      ProfileStepOne(),
      ProfileStepTwo(),
      ProfileStepThree(),
      ProfileStepFour(),
    ];
    return pages[index];
  }
}
