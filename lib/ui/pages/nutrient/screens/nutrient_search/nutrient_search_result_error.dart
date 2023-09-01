import 'package:flutter/material.dart';

class NutrientSearchResultErrorEmptySearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Please enter text to search'),
    );
  }
}

class NutrientSearchResultNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Results not found'),
    );
  }
}
