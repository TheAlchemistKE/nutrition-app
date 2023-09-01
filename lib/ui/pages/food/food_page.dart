import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/fonts.dart';
import 'package:nutrinowapp/constants/strings.dart';
import 'package:nutrinowapp/ui/pages/food/components/food_page_category_pane.dart';
import 'package:nutrinowapp/ui/pages/food/screens/food_search/food_search_delegate.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  late bool togglePlaceholder = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async =>
              setState(() => togglePlaceholder = !togglePlaceholder),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.all(18),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: FractionalOffset.topRight,
                    child: Container(
                      child: IconButton(
                        color: Colors.black,
                        onPressed: () => openFoodSearch(context),
                        icon: Icon(
                          Icons.search_sharp,
                          size: 32,
                          color: themeColor,
                        ),
                      ),
                    ),
                  ),

                  // Title top margin
                  SizedBox(height: 10),

                  // Title
                  Align(
                    alignment: FractionalOffset.topLeft,
                    child: Text(
                      foodScreenTitle,
                      style: roboto(
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  // Food gridview section
                  FoodPageCategoryPane(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
