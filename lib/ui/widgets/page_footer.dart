import 'package:flutter/material.dart';
import 'package:nutrinowapp/app/routes.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/ui/icons/custom_menu_icons.dart';

typedef PageFooterOnTap = Function(int i);

class PageFooter extends StatelessWidget {
  final int currentIndex;

  const PageFooter({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.grey.shade300, blurRadius: 10),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 5,
          unselectedItemColor: Colors.grey.shade400,
          selectedItemColor: themeColor,
          selectedFontSize: 12,
          showSelectedLabels: false,
          iconSize: 32,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: (int idx) => PageFooterNavigate(context, idx),
          currentIndex: currentIndex,
          backgroundColor: clFFFDFD,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomMenuIcons.diary2),
              label: 'Diary',
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomMenuIcons.recommendation),
              label: 'Recommend',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.perm_identity),
            //   label: 'Profile',
            // )
          ],
        ));
  }
}

var _routes = [
  NutriNowRoutes.homePage,
  NutriNowRoutes.diaryPage,
  NutriNowRoutes.recommendPage,
  NutriNowRoutes.manageProfilesPage,
];

void PageFooterNavigate(BuildContext context, int idx) {
  var route = idx >= _routes.length || idx < 0 ? '/' : _routes[idx];
  Navigator.pushReplacementNamed(context, route);
}
