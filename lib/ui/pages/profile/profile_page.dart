import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrinowapp/models/profile/profile_model.dart';
import 'package:nutrinowapp/provider/account/profile_setup_provider.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/profile_page_body_page_back_button.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/profile_page_body_page_bottom_button.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/profile_page_body_top_page_counter.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/step1/profile_step1.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/step2/profile_step2.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/step3/profile_step3.dart';
import 'package:nutrinowapp/ui/pages/profile/components/edit/step4/profile_step4.dart';
import 'package:nutrinowapp/ui/widgets/modal_dialog.dart';
import 'package:provider/provider.dart';

typedef OnBoardProfileCallback = Future<String> Function(ProfileModel);

class ProfilePage extends StatefulWidget {
  final OnBoardProfileCallback onComplete;
  final bool showCloseBtn;

  const ProfilePage(
      {Key? key, required this.onComplete, this.showCloseBtn = false})
      : super(key: key);

  @override
  _ProfilePageBody createState() => _ProfilePageBody();
}

class _ProfilePageBody extends State<ProfilePage> {
  late PageController controller;
  int _currPage = 0;
  final totalPages = 4;

  final _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  final pages = <Widget>[
    ProfileStepOne(),
    ProfileStepTwo(),
    ProfileStepThree(),
    ProfileStepFour(),
  ];

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var profile = Provider.of<ProfileSetupProvider>(context, listen: true);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      ProfilePageBodyPageBackButton(
                        onPressed: () async {
                          if (_currPage <= 0) {
                            await Navigator.maybePop(context);
                            return;
                          }
                          setState(() => _currPage -= 1);
                          await goToPage(_currPage);
                        },
                      ),
                      Expanded(
                        child: ProfilePageBodyTopPageCounter(
                          currentPage: _currPage,
                          totalPages: totalPages,
                        ),
                      ),
                      if (widget.showCloseBtn && _currPage >= 1)
                        ProfilePageBodyPageCloseButton()
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                  flex: 4,
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller,
                    onPageChanged: (i) => setState(() => _currPage = i),
                    itemBuilder: (BuildContext context, int index) {
                      return Form(
                        key: _formKeys[index],
                        child: pages[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: ProfilePageBodyPageBottomButton(
            onPressed: () async {
              if (!_formKeys[_currPage].currentState!.validate()) {
                return;
              }

              _formKeys[_currPage].currentState!.save();

              if (_currPage >= totalPages - 1) {
                await widget.onComplete(profile.profileModel);
                return;
              }
              setState(() => _currPage += 1);
              await goToPage(_currPage);
              profile.debug();
            },
          ),
        ),
      ),
    );
  }

  Future<void> goToPage(int page) async {
    return controller.animateToPage(
      page,
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 500),
    );
  }
}

void openProfilePage(BuildContext context,
    {ProfileModel? profile, OnBoardProfileCallback? onComplete}) {
  var p = Provider.of<ProfileSetupProvider>(context, listen: false);
  if (profile == null) {
    p.clear();
  } else {
    p.profileModel = profile;
  }

  ModalDialog.showDialogWidget(
    context,
    ProfilePage(
      onComplete: onComplete ?? (profile) async => '',
      showCloseBtn: true,
    ),
  );
}
