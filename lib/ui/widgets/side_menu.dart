import 'package:flutter/material.dart';
import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/app/routes.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/models/profile/profile_model.dart';
import 'package:nutrinowapp/provider/account/account_provider.dart';
import 'package:nutrinowapp/service/profile/profile_service.dart';
import 'package:nutrinowapp/ui/pages/profile/profile_page.dart';
import 'package:nutrinowapp/ui/widgets/network_img_icon.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var account = Provider.of<AccountProvider>(context, listen: true);
    return Container(
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListView(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(color: Colors.grey.shade100),
                    child: ListTile(
                      onTap: () {
                        if (account.defaultProfile != null) {
                          openProfilePage(
                            context,
                            profile: account.defaultProfile!,
                            onComplete: (ProfileModel profile) async {
                              await ProfileService.updateProfile(profile);
                              Navigator.pop(context);
                              return '';
                            },
                          );
                        }
                      },
                      title: Text(
                        account.defaultProfile!.name.capitalizeFirstOfEach,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: themeColor,
                        ),
                      ),
                      trailing: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
                        child: Icon(Icons.person_outline, color: themeColor),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        border: Border(
                          top: BorderSide(color: Colors.grey.shade300),
                          bottom: BorderSide(color: Colors.grey.shade300),
                        )),
                    child: ListTile(
                      leading: SizedBox(
                        width: 28,
                        height: 28,
                        child: NetworkImgIcon(
                          Api.api(prefix: 'static').uri(
                            path: 'images/platform/icons/premium-icon.png',
                          ),
                          color: themeColor,
                          size: 28,
                        ),
                      ),
                      title: Text(
                        'Try Premium Membership',
                        style: TextStyle(color: themeColor),
                      ),
                      onTap: () {},
                    ),
                  ),
                  listItem('Browse Foods', Icons.food_bank,
                      () => print('clicked Browse Foods')),
                  listItem('Reminders', Icons.alarm,
                      () => print('clicked Reminders')),
                  listItem('Bookmarked', Icons.bookmark_outline,
                      () => print('clicked Bookmarked')),
                  listItem('Settings', Icons.settings_outlined,
                      () => navigateTo(context, NutriNowRoutes.settingsPage)),
                  listItem('Help me', Icons.help_outline,
                      () => navigateTo(context, NutriNowRoutes.helpPage)),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade300)),
                ),
                child: ListTile(
                  leading: SizedBox(
                    width: 28,
                    height: 28,
                    child: NetworkImgIcon(
                      Api.api(prefix: 'static')
                          .uri(path: 'images/platform/icons/persons-icon.png'),
                      color: themeColor,
                      size: 28,
                    ),
                  ),
                  title: Text(
                    'Manage Profiles',
                    style: TextStyle(
                      color: themeColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () =>
                      navigateTo(context, NutriNowRoutes.manageProfilesPage),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listItem(String name, IconData icon, Function onTap) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: cl1D4651, size: 31),
        title: Text(
          name,
          style: TextStyle(
            color: cl1D4651,
            fontSize: 19,
            fontWeight: FontWeight.w400,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
