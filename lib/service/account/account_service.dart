import 'dart:convert';

import 'package:nutrinowapp/models/account/account_model.dart';
import 'package:nutrinowapp/service/app_service.dart';

class AccountService {
  static final String _accountIdKey = 'accountId';

  static Future<bool> setAccount(AccountModel acc) {
    return AppService.store.saveString(_accountIdKey, json.encode(acc));
  }

  static Future<AccountModel?> getAccount() async {
    var jsonString = await AppService.store.getString(_accountIdKey);

    if (jsonString == null || jsonString.isEmpty) {
      return Future.error('default profile is not set');
    }
    return AccountModel.fromString(jsonString);
  }
}
