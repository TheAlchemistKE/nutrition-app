import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/fonts.dart';
import 'package:nutrinowapp/models/app/metric_model.dart';

class FoodDetailsNutrientMetricsDropDown extends StatefulWidget {
  final Function onChange;
  final MetricModel defaultMetric;

  const FoodDetailsNutrientMetricsDropDown({
    Key? key,
    required this.onChange,
    required this.defaultMetric,
  }) : super(key: key);

  @override
  _FoodDetailsNutrientMetricsDropDownState createState() =>
      _FoodDetailsNutrientMetricsDropDownState();
}

class _FoodDetailsNutrientMetricsDropDownState
    extends State<FoodDetailsNutrientMetricsDropDown> {
  //TODO: Fetch from db
  final List<MetricModel> allMetrics = [
    MetricModel(
        id: 1, value: '100 grams', isBase: false, description: '', groupId: 1)
  ];

  late MetricModel defaultMetric = MetricModel(
      id: 1, value: '100 grams', description: '', isBase: false, groupId: 1);

  @override
  void initState() {
    super.initState();
    defaultMetric = widget.defaultMetric;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: DropdownButton<MetricModel>(
        underline: SizedBox(),
        value: defaultMetric,
        style: opensSans(
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.black,
          ),
        ),
        items: allMetrics.map((MetricModel m) {
          return DropdownMenuItem<MetricModel>(
            value: m,
            child: Text(
              m.value,
              overflow: TextOverflow.fade,
              style: opensSans(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
          );
        }).toList(),
        onChanged: (MetricModel? metric) {
          setState(() => defaultMetric = metric!);
          widget.onChange(metric);
        },
      ),
    );
  }
}
