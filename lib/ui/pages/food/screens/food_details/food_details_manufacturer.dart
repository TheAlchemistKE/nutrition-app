import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/fonts.dart';
import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/models/food/food_details_model.dart';

class FoodDetailsManufacturer extends StatelessWidget {
  final FoodDetailsModel foodDetailsModel;

  const FoodDetailsManufacturer(this.foodDetailsModel, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        left: 25,
        top: 10,
        bottom: 10,
        right: 30,
      ),
      child: Wrap(
        children: [
          Text(
            'Manufacturer:',
            style: roboto(
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 5),
          Container(
            child: Text(
              foodDetailsModel.manufacture.inCaps,
              maxLines: 2,
              overflow: TextOverflow.fade,
              style: opensSans(
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
