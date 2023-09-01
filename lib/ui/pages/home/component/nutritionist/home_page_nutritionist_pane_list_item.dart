import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/models/nutritionist/nutritionist_model.dart';

class HomePageNutritionistPaneListItem extends StatelessWidget {
  final NutritionistModel nutritionist;
  final double itemHeight;
  final double itemWidth;

  const HomePageNutritionistPaneListItem({
    Key? key,
    required this.nutritionist,
    required this.itemHeight,
    required this.itemWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: clFDB74F,
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              width: itemWidth,
              padding: EdgeInsets.all(18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 30,
                    child: Text(
                      nutritionist.name.capitalizeFirstOfEach,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18),
            alignment: Alignment.center,
            width: itemWidth,
            child: Text(
              nutritionist.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: themeColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class HomePageNutritionistPaneListItemLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
