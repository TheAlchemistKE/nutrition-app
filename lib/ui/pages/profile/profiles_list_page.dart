import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/provider/account/account_provider.dart';
import 'package:nutrinowapp/service/profile/profile_service.dart';
import 'package:nutrinowapp/ui/pages/profile/components/list/profile_list.dart';
import 'package:nutrinowapp/ui/pages/profile/profile_page.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProfileListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var account = Provider.of<AccountProvider>(context, listen: false);
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
            // backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Center(child: standardHeaderTitle(name: 'Profiles')),
            actions: [
              IconButton(
                icon: Icon(Icons.person_add_alt_1_sharp, color: Colors.white),
                onPressed: () {
                  openProfilePage(
                    context,
                    profile: null,
                    onComplete: (profile) async {
                      account.defaultProfile =
                          await ProfileService.createNewProfile(profile);
                      Navigator.pop(context);
                      return '';
                    },
                  );
                },
              ),
              PopupMenuButton<String>(
                onSelected: (String choice) {
                  switch (choice) {
                    case 'Logout':
                      account.defaultProfile = null;
                      break;
                  }
                },
                itemBuilder: (BuildContext context) {
                  return {'Logout'}.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),
            ],
          ),
          body: ProfileList(),
        ),
      ),
    );
  }
}
