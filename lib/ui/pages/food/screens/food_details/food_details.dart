import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/models/food/food_details_model.dart';
import 'package:nutrinowapp/ui/pages/food/screens/food_details/food_details_pane.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';
import 'package:nutrinowapp/ui/widgets/modal_dialog.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class FoodDetailsScreen extends StatefulWidget {
  final FoodDetailsModel foodDetailsModel;

  const FoodDetailsScreen(this.foodDetailsModel, {Key? key}) : super(key: key);

  @override
  _FoodDetailsScreenState createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  late Future<dynamic> _futureFoodDetails;

  @override
  void initState() {
    super.initState();
    setFutureFood();
  }

  void setFutureFood() =>
      _futureFoodDetails = Api.api().get('/food/${widget.foodDetailsModel.id}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: themeColor,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        child: CustomFutureBuilder(
          source: _futureFoodDetails,
          builder: (BuildContext ctx, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData) {
              return _buildErrorWidget();
            }
            return FoodDetailsPane(FoodDetailsModel.fromJson(snapshot.data));
          },
          loader: SizedBox(height: 5, child: linearProgress),
          errorHandler: (error) => FutureBuilderErrorDisplay('$error'),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() => Container();
}

void openFoodDetails(BuildContext context, FoodDetailsModel foodDetailsModel) {
  ModalDialog.showDialogWidget(context, FoodDetailsScreen(foodDetailsModel));
}
