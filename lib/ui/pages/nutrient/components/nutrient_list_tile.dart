import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/fonts.dart';
import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_model.dart';
import 'package:nutrinowapp/ui/pages/nutrient/screens/nutrient_details/nutrient_details.dart';

class NutrientListTile extends StatelessWidget {
  final NutrientModel nutrientModel;

  const NutrientListTile(this.nutrientModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openNutrientDetails(context, nutrientModel),
      child: Container(
          color: Colors.grey.shade100,
          height: 125,
          width: double.infinity,
          child: Row(
            children: [
              NutrientListTileLeading(nutrientModel),
              SizedBox(width: 10),
              Expanded(child: NutrientListTileContent(nutrientModel)),
              NutrientListTileTrailing(nutrientModel),
            ],
          )),
    );
  }
}

class NutrientListTileLeading extends StatelessWidget {
  final NutrientModel nutrientModel;
  final Border border;
  final BorderRadius borderRadius;

  const NutrientListTileLeading(this.nutrientModel,
      {Key? key, Border? border, BorderRadius? borderRadius})
      : border = border ?? const Border(),
        borderRadius = borderRadius ?? BorderRadius.zero,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: nutrientModel.bgColor.toColor(),
        border: border,
        borderRadius: borderRadius,
      ),
      width: 95,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // First character
          Text(
            nutrientModel.name.firstChar,
            style: opensSans(
              style: TextStyle(
                fontSize: 36,
                color: nutrientModel.fgColor.toColor(),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 10),

          // Daily Intake sub title
          Text(
            'Daily Intake',
            style: opensSans(
              style: TextStyle(
                fontSize: 10.5,
                color: nutrientModel.fgColor.toColor(),
              ),
            ),
          ),

          SizedBox(height: 1),

          // Recommended daily intake
          Text(
            nutrientModel.rdiAmount,
            style: opensSans(
              style: TextStyle(
                fontSize: 11,
                color: nutrientModel.fgColor.toColor(),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NutrientListTileContent extends StatelessWidget {
  final NutrientModel nutrient;

  const NutrientListTileContent(this.nutrient, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 16, right: 12, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Container(
            child: Text(
              nutrient.name.inCaps,
              style: roboto(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          // Description
          Container(
            margin: EdgeInsets.only(top: 6),
            child: Text(
              nutrient.description.inCaps,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: alegreya(
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                  height: 1.2,
                ),
              ),
            ),
          ),

          // Intake Amounts
          Container(
            margin: EdgeInsets.only(top: 18),
            child: NutrientListTileContentIntake(nutrient),
          ),
        ],
      ),
    );
  }
}

class NutrientListTileTrailing extends StatelessWidget {
  final NutrientModel nutrientModel;

  const NutrientListTileTrailing(this.nutrientModel, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.keyboard_arrow_right_sharp,
            size: 28,
          )
        ],
      ),
    );
  }
}

class NutrientListTileContentIntake extends StatelessWidget {
  final NutrientModel nutrientModel;
  final Color titleColor;
  final Color valueColor;

  const NutrientListTileContentIntake(
    this.nutrientModel, {
    Key? key,
    this.titleColor = clB2B2AE,
    this.valueColor = cl666B65,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Low',
                style: roboto(
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 11.5,
                    color: titleColor,
                  ),
                ),
              ),
              SizedBox(height: 4),
              Text(
                nutrientModel.llAmount,
                style: opensSans(
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 11.5,
                    color: valueColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recommend',
                style: roboto(
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 11.5,
                    color: titleColor,
                  ),
                ),
              ),
              SizedBox(height: 4),
              Text(
                nutrientModel.rdiAmount,
                style: opensSans(
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 11.5,
                    color: valueColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upper Limit',
                style: roboto(
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 11.5,
                    color: titleColor,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                nutrientModel.ulAmount,
                style: opensSans(
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 11.5,
                    color: valueColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
