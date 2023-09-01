import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';
import 'package:nutrinowapp/ui/widgets/html_wrapper.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class SignupTacPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: themeColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: themeColor,
          appBar: AppBar(
            elevation: 0,
            leading: BackButton(),
            title: Center(
              child: standardHeaderTitle(name: 'Terms & Conditions'),
            ),
            backgroundColor: themeColor,
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: BoxDecoration(color: Colors.grey.shade100),
            constraints: BoxConstraints.expand(),
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: SignupTacPageBody(),
            ),
          ),
        ),
      ),
    );
  }
}

class SignupTacPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: CustomFutureBuilder(
          source: Api.api().get('/static/docs/t&c.html'),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return HtmlWrapper(snapshot.data);
          },
          loader: Center(child: centerCircularProgress),
          errorHandler: (error) => Text('$error'),
        ),
      ),
    );
  }
}
