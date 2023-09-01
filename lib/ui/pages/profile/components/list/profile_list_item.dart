import 'package:flutter/material.dart';
import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/models/profile/profile_model.dart';
import 'package:nutrinowapp/provider/account/account_provider.dart';
import 'package:nutrinowapp/service/profile/profile_service.dart';
import 'package:nutrinowapp/ui/pages/profile/profile_page.dart';
import 'package:provider/provider.dart';

class ProfileListItemTile extends StatelessWidget {
  final int index;
  final ProfileModel profile;
  final bool isDefault;

  const ProfileListItemTile(
      {Key? key,
      required this.index,
      required this.profile,
      required this.isDefault})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        displayModalBottomSheet(context, profile);
      },
      leading: Container(
        margin: EdgeInsets.only(left: 20),
        width: 25,
        child: Text(
          '${index + 1}.',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: isDefault ? Colors.white : Colors.black,
              ),
        ),
      ),
      title: Text(
        profile.name.capitalizeFirstOfEach,
        style: Theme.of(context).textTheme.headline5!.copyWith(
              color: isDefault ? Colors.white : Colors.black,
            ),
      ),
      trailing: IconButton(
        onPressed: null,
        icon: Icon(
          Icons.navigate_next_rounded,
          color: isDefault ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  void displayModalBottomSheet(BuildContext context, ProfileModel item) {
    var account = Provider.of<AccountProvider>(context, listen: false);
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bottomModalContext) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit'),
                onTap: () async {
                  await Navigator.of(bottomModalContext).maybePop();
                  openProfilePage(
                    context,
                    profile: item,
                    onComplete: (profile) async {
                      await ProfileService.updateProfile(profile);
                      Navigator.pop(context);
                      return '';
                    },
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.person_pin_circle_outlined),
                title: Text('Make default'),
                onTap: () {
                  Navigator.pop(context);
                  account.defaultProfile = item;
                },
              ),

              // Delete profile
              ListTile(
                leading: Icon(Icons.delete_forever_rounded, color: Colors.red),
                title: Text('Delete', style: TextStyle(color: Colors.red)),
                onTap: () async {
                  Navigator.pop(context);
                  await ProfileService.deleteProfile(profile);
                  account.removeProfile(item);
                },
              ),
            ],
          );
        });
  }
}
