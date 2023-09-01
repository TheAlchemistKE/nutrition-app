import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nutrinowapp/helper/utility.dart';
import 'package:nutrinowapp/models/app/metric_model.dart';
import 'package:nutrinowapp/service/profile/profile_onboarding_service.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

typedef FunctionValue = Function(dynamic);

class ProfileStepThreeWeight extends StatelessWidget {
  final FunctionValue onChanged;
  final FunctionValue onMetricChanged;
  final num initialVal;
  final String initialMetricVal;

  const ProfileStepThreeWeight({
    Key? key,
    required this.onChanged,
    required this.onMetricChanged,
    required this.initialVal,
    required this.initialMetricVal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 4,
          child: _ProfileStepThreeWeightTextField(
            onChanged: onChanged,
            initialValue: initialVal,
          ),
        ),
        Expanded(child: Container()),
        Expanded(
          flex: 2,
          child: _ProfileStepThreeWeightMetricDropDown(
            initialMetricVal: initialMetricVal,
            onMetricChanged: onMetricChanged,
          ),
        ),
      ],
    );
  }
}

class _ProfileStepThreeWeightTextField extends StatelessWidget {
  final num initialValue;
  final FunctionValue onChanged;

  const _ProfileStepThreeWeightTextField({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue != 0.0 ? initialValue.toString() : '',
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        labelText: AppLocalizations.of(context)!.signupWeightLabel,
        hintText: AppLocalizations.of(context)!.signupWeightHint,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.signupWeightValidatorText;
        }
        return null;
      },
      onChanged: onChanged,
      onSaved: onChanged,
    );
  }
}

class _ProfileStepThreeWeightMetricDropDown extends StatelessWidget {
  final String initialMetricVal;
  final FunctionValue onMetricChanged;

  const _ProfileStepThreeWeightMetricDropDown(
      {Key? key, required this.initialMetricVal, required this.onMetricChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomFutureBuilder(
        source: ProfileOnBoardingService.fetchWeightMetric(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!(snapshot.data is List<dynamic>) ||
              !snapshot.hasData ||
              snapshot.data.length < 1) {
            return circularProgress;
          }
          return _dropDownMenu(snapshot.data);
        },
        loader: circularProgress,
        errorHandler: (error) => circularProgress,
      ),
    );
  }

  Widget _dropDownMenu(List<MetricModel> items) {
    return Container(
      alignment: Alignment.centerRight,
      child: DropdownButtonFormField<MetricModel>(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Metric',
        ),
        isExpanded: true,
        value: firstWhere(
          items,
          (elem) {
            if (initialMetricVal.isEmpty) return elem.isDefault;
            return elem.value == initialMetricVal;
          },
        ),
        items: items.map((MetricModel value) {
          return DropdownMenuItem<MetricModel>(
            value: value,
            child: Text(value.value),
          );
        }).toList(),
        onChanged: onMetricChanged,
        onSaved: onMetricChanged,
      ),
    );
  }
}
