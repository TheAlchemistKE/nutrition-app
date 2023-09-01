import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/models/diary/generic_diary_history_model.dart';
import 'package:nutrinowapp/ui/widgets/shimmer_loading.dart';

class GenericDiaryPageHistoryItem extends StatelessWidget {
  final GenericDiaryHistoryModel historyModel;

  const GenericDiaryPageHistoryItem({Key? key, required this.historyModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      margin: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            historyModel.cleanDate,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: cl4E6E77, fontWeight: FontWeight.w700, fontSize: 14.5),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    historyModel.change < 0 ? chartDownIcon() : chartUpIcon(),
                    SizedBox(width: 5),
                    Text(
                      historyModel.changeDisplay,
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.5,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(
                  historyModel.valueDisplay,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: cl171717,
                      ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget chartUpIcon() => Icon(
        Icons.moving_outlined,
        color: Colors.green,
        size: 28,
      );

  Widget chartDownIcon() => Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationX(pi),
        child: Icon(
          Icons.moving_outlined,
          size: 28,
          color: Colors.green,
        ),
      );
}

class GenericDiaryPageHistoryItemLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: true,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        margin: EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
