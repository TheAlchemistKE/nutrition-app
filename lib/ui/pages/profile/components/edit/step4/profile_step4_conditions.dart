import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nutrinowapp/models/healthcondition/health_condition_model.dart';
import 'package:nutrinowapp/models/profile/profile_health_condition_model.dart';
import 'package:nutrinowapp/service/profile/profile_onboarding_service.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';

typedef ProfileStepFourConditionsCb = void Function(
    List<ProfileHealthConditionModel>?);

class ProfileStepFourConditions extends StatefulWidget {
  final ProfileStepFourConditionsCb onSaved;
  final ProfileStepFourConditionsCb onChanged;
  final List<ProfileHealthConditionModel> selectedItems;

  const ProfileStepFourConditions(
      {Key? key,
      required this.onSaved,
      required this.onChanged,
      this.selectedItems = const []})
      : super(key: key);

  @override
  State<ProfileStepFourConditions> createState() =>
      _ProfileStepFourConditionsState();
}

class _ProfileStepFourConditionsState extends State<ProfileStepFourConditions> {
  var _futureHealthCond;

  @override
  void initState() {
    super.initState();
    _futureHealthCond = ProfileOnBoardingService.fetchHealthConditions();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomFutureBuilder(
        source: _futureHealthCond,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!(snapshot.data is List<dynamic>) ||
              !snapshot.hasData ||
              snapshot.data.length < 1) {
            return CircularProgressIndicator();
          }
          return _dropDownSearch(context, snapshot.data);
        },
        loader: CircularProgressIndicator(),
        errorHandler: (error) => Text('$error'),
      ),
    );
  }

  Widget _dropDownSearch(
      BuildContext context, List<HealthConditionModel> conditions) {
    return DropdownSearch<ProfileHealthConditionModel>.multiSelection(
      // showSearchBox: true,
      enabled: true,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      validator: (v) => v == null || v.isEmpty
          ? AppLocalizations.of(context)!
              .signupPreExistingConditionsValidatorText
          : null,
      // dropdownSearchDecoration: InputDecoration(
      //   labelText:
      //       AppLocalizations.of(context)!.signupPreExistingConditionsLabel,
      //   contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
      //   border: OutlineInputBorder(),
      // ),
      // mode: Mode.BOTTOM_SHEET,
      // showSelectedItems: true,
      selectedItems: widget.selectedItems,
      items: conditions
          .map((e) => ProfileHealthConditionModel(
                id: 0,
                knownFamilyHistory: 'No',
                healthCondition: e,
              ))
          .toList(),
      // showClearButton: true,
      // clearButtonSplashRadius: 20,
      // popupBarrierDismissible: true,
      // showAsSuffixIcons: true,
      // showFavoriteItems: true,
      // favoriteItemsAlignment: MainAxisAlignment.start,
      // favoriteItems: (items) {
      //   return items.where((e) => e.name.contains('Fav')).toList();
      // },
      compareFn: (ProfileHealthConditionModel? item, selected) {
        if (item == null || selected == null) return false;
        return item.healthCondition.name == selected.healthCondition.name;
      },
      // favoriteItemBuilder: (context, item, isSelected) {
      //   return Container(
      //     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      //     decoration: BoxDecoration(
      //       border: Border.all(color: Colors.grey),
      //       borderRadius: BorderRadius.circular(10),
      //       color: Colors.grey[100],
      //     ),
      //     child: Row(
      //       children: [
      //         Text(
      //           '$item',
      //           textAlign: TextAlign.center,
      //           style: TextStyle(color: Colors.indigo),
      //         ),
      //         Padding(padding: EdgeInsets.only(left: 8)),
      //       ],
      //     ),
      //   );
      // },
      // popupSafeArea: PopupSafeAreaProps(top: true, bottom: true),
      // scrollbarProps: ScrollbarProps(isAlwaysShown: true, thickness: 7),
      // popupItemBuilder: (BuildContext context, ProfileHealthConditionModel item,
      //     bool isSelected) {
      //   return Container(
      //     decoration: BoxDecoration(
      //       border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
      //     ),
      //     child: ListTile(
      //       subtitle: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             'Known family history of the pre-existing condition',
      //           ),
      //           Row(
      //             children: [
      //               Checkbox(
      //                 value: false,
      //                 onChanged: (val) => print('hekki'),
      //               ),
      //               Text('Yes'),
      //               Checkbox(
      //                 value: true,
      //                 onChanged: (val) => print('yesss'),
      //               ),
      //               Text('No'),
      //               Checkbox(
      //                 value: false,
      //                 onChanged: (val) => print('nooo'),
      //               ),
      //               Text("I don't know"),
      //             ],
      //           )
      //         ],
      //       ),
      //       title: Text('${item.healthCondition.name}'),
      //     ),
      //   );
      // },
    );
  }
}
