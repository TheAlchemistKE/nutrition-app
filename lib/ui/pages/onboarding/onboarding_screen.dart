import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';

class OnBoardingScreen extends StatelessWidget {
  final String header;
  final String subTitle;
  final String description;
  final String imageSrc;

  const OnBoardingScreen(
      {Key? key,
      required this.header,
      required this.subTitle,
      required this.description,
      required this.imageSrc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageWidth = goldenRatioSmall(MediaQuery.of(context).size.width);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            header,
            style: Theme.of(context).textTheme.headline3?.copyWith(
                  color: themeColor,
                ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(child: Image.asset(imageSrc, height: imageWidth)),
        ),
        SizedBox(height: 20),
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  subTitle.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: themeColor,
                      ),
                ),
                SizedBox(height: 15),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: themeColor,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
