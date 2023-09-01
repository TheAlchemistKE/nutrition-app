import 'package:flutter/material.dart';
import 'package:nutrinowapp/ui/pages/recommendation/screens/progress/recommendation_progress_graph.dart';

class RecommendationProgressBodyWeek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Expanded(child: RecommendationProgressGraph()),
        ],
      ),
    );
  }
}
