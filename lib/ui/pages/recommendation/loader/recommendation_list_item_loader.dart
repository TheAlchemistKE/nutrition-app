import 'package:flutter/material.dart';
import 'package:nutrinowapp/ui/widgets/shimmer_loading.dart';

class RecommendationListItemLoader extends StatelessWidget {
  final double cardWidth;

  const RecommendationListItemLoader({Key? key, required this.cardWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
        isLoading: true,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.white, width: 0.0),
          ),
          elevation: 2,
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            width: cardWidth,
          ),
        ));
  }
}
