import 'package:flutter/material.dart';

class CustomFutureBuilder extends StatelessWidget {
  final Future<dynamic> source;
  final Function builder;
  final Function errorHandler;
  final Widget loader;

  CustomFutureBuilder(
      {Key? key,
      required this.source,
      required this.builder,
      required this.errorHandler,
      required this.loader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: source,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return loader;
          default:
            if (snapshot.hasError) return errorHandler(snapshot.error);

            return builder(context, snapshot);
        }
      },
    );
  }
}

class FutureBuilderErrorDisplay extends StatelessWidget {
  final String msg;

  const FutureBuilderErrorDisplay(this.msg, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(msg);
  }
}
