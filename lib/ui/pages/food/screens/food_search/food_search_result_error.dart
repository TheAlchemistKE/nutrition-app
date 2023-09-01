import 'package:flutter/material.dart';

class FoodSearchResultErrorEmptySearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Please enter text to search'),
    );
  }
}

class FoodSearchResultErrorNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Results not found'),
    );
  }
}
