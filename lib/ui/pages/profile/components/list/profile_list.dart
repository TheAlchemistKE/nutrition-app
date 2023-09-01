import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/provider/account/account_provider.dart';
import 'package:nutrinowapp/ui/pages/profile/components/list/profile_list_item.dart';
import 'package:provider/provider.dart';

class ProfileList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var account = Provider.of<AccountProvider>(context, listen: true);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        physics: ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: ShapeDecoration(
              shape: StadiumBorder(),
              color: account.isDefaultProfile(account.profiles[index])
                  ? cl2D786E
                  : Colors.white,
            ),
            child: ProfileListItemTile(
              profile: account.profiles[index],
              index: index,
              isDefault: account.isDefaultProfile(account.profiles[index]),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(height: 20);
        },
        itemCount: account.profiles.length,
      ),
    );
  }
}
