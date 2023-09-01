import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class ConnectionProvider extends ChangeNotifier {
  ConnectivityResult? _prevConnectionStatus;
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  bool _connectionChecked = false;
  bool _isInitial = true;
  bool _reEstablishedAndDisplayed = false;

  ConnectivityResult get connectionState => _connectionStatus;

  set connectionState(ConnectivityResult status) {
    if (_prevConnectionStatus != null) {
      _isInitial = false;
    }
    _prevConnectionStatus = _connectionStatus;
    _connectionStatus = status;
    _connectionChecked = true;
    notifyListeners();
  }

  bool get isNoConnectionChange =>
      _connectionChecked &&
      (_prevConnectionStatus != _connectionStatus ||
          (_prevConnectionStatus == ConnectivityResult.none &&
              _connectionStatus == ConnectivityResult.none)) &&
      _connectionStatus == ConnectivityResult.none;

  bool get isYesConnectionChange =>
      !_isInitial &&
      _connectionChecked &&
      _prevConnectionStatus != _connectionStatus &&
      _prevConnectionStatus == ConnectivityResult.none &&
      (_connectionStatus == ConnectivityResult.wifi ||
          _connectionStatus == ConnectivityResult.mobile);

  void displayConnectionChangeSnackBar(BuildContext context) {
    if (isNoConnectionChange) {
      clearAndShowSnackBar(
        context,
        'Network connection unavailable. Please connect to the internet.',
        color: Colors.grey.shade800,
        duration: Duration(days: 1),
      );
      _reEstablishedAndDisplayed = false;
    } else if (isYesConnectionChange && !_reEstablishedAndDisplayed) {
      _reEstablishedAndDisplayed = true;
      clearAndShowSnackBar(
        context,
        'Connection established.',
        color: Colors.green.shade900,
        duration: Duration(seconds: 5),
      );
    }
  }
}
