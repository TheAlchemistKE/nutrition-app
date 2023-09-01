import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/strings.dart';

Widget standardChartIconButton({color = Colors.white}) => IconButton(
      icon: Icon(Icons.chat, color: color),
      onPressed: () => print('clicked chat'),
    );

Widget standardHeaderTitle({color = Colors.white, name = appDisplayName}) =>
    Text(
      name,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );

Widget imgOverlay({
  double opacity = 0.3,
  Color color = imgOverlayColor,
  BorderRadius borderRadius = BorderRadius.zero,
}) {
  return Container(
    decoration: BoxDecoration(
      color: color.withOpacity(opacity),
      borderRadius: borderRadius,
    ),
  );
}

final linearProgress = Container(
  constraints: BoxConstraints(maxHeight: 1.5, maxWidth: double.infinity),
  child: LinearProgressIndicator(
    backgroundColor: themeColor.withOpacity(0.1),
    valueColor: AlwaysStoppedAnimation<Color>(themeColor),
  ),
);

final circularProgress = Center(
  child: Container(
    constraints: BoxConstraints(maxHeight: 25, maxWidth: 25),
    child: CircularProgressIndicator(
      backgroundColor: themeColor.withOpacity(0.1),
      valueColor: AlwaysStoppedAnimation<Color>(themeColor),
      strokeWidth: 2.0,
    ),
  ),
);

final centerCircularProgress = Container(
  alignment: Alignment.center,
  child: circularProgress,
);

void showSnackBar(BuildContext context, String msg,
    {Color color = themeColor,
    Color texColor = Colors.white,
    Duration duration = const Duration(seconds: 30)}) {
  Future.delayed(Duration.zero, () async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        content: Text(
          '$msg',
          style: TextStyle(color: texColor),
        ),
        backgroundColor: color,
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Colors.white54,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  });
}

void clearAndShowSnackBar(
  BuildContext context,
  String msg, {
  Color color = themeColor,
  Color texColor = Colors.white,
  Duration duration = const Duration(seconds: 30),
}) {
  clearSnackBar(context);
  showSnackBar(context, msg, color: color, duration: duration);
}

void clearSnackBar(BuildContext context) =>
    Future.delayed(Duration.zero, () async {
      ScaffoldMessenger.of(context).clearSnackBars();
    });

void noConnectionDisplaySnackBar(BuildContext context) {
  clearAndShowSnackBar(
    context,
    'Network connection lost. Please connect to the internet.',
    color: Colors.grey.shade800,
    duration: Duration(days: 1),
  );
}

void connectionEstablishedDisplaySnackBar(BuildContext context) {}
