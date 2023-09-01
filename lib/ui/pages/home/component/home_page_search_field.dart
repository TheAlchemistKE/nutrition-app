import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/fonts.dart';
import 'package:nutrinowapp/constants/strings.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_search_filter_model.dart';
import 'package:nutrinowapp/ui/pages/nutrient/screens/nutrient_search/nutrient_search_delegate.dart';

class HomePageHomePageSearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openNutrientSearch(context, NutrientSearchFilterModel()),
      child: Container(
        child: TextField(
          keyboardType: TextInputType.text,
          enabled: false,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 22, horizontal: 2),
            filled: true,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12, width: 0.4),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            hintText: homeScreenSearchFieldHintText,
            labelText: homeScreenSearchFieldHintText,
            hintStyle: roboto(
              style: TextStyle(
                color: themeColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            prefixIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(Icons.search, color: themeColor, size: 36),
            ),
            prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
          ),
        ),
      ),
    );
  }
}
