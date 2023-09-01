import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';

class ProfilePageBodyTopPageCounter extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const ProfilePageBodyTopPageCounter({
    Key? key,
    required this.currentPage,
    required this.totalPages,
  })  : assert(currentPage >= 0, 'current page should be greater than zero'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                '${currentPage + 1} of $totalPages',
                style: TextStyle(
                  fontSize: 16,
                  color: themeColor,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 8, top: 15),
              child: Wrap(
                children: [
                  for (var index = 0; index < 4; index++) createOval(index)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer createOval(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.only(right: 6),
      height: 10,
      width: 30,
      decoration: BoxDecoration(
        border: Border.all(color: themeColor),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        shape: BoxShape.rectangle,
        color: currentPage >= index ? themeColor : Colors.transparent,
      ),
    );
  }
}
