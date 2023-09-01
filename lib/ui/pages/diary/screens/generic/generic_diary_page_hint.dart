import 'package:flutter/material.dart';
import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/models/diary/diary_kind_model.dart';
import 'package:nutrinowapp/ui/widgets/network_img_icon.dart';

class GenericDiaryPageHint extends StatelessWidget {
  final DiaryKindModel diaryModel;

  const GenericDiaryPageHint({Key? key, required this.diaryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tips of the day',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                NetworkImgIcon(
                  Api.api(prefix: 'static').uri(
                    path: diaryModel.tipOfTheDayIcon,
                  ),
                  color: Colors.yellow.shade700,
                  size: 32,
                  loader: Container(width: 32, height: 32),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              child: Text(
                diaryModel.tipOfTheDay,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: themeColor,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
