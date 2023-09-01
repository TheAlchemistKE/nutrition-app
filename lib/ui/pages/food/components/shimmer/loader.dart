import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class Loader extends StatelessWidget {
  final BoxDecoration decoration;

  const Loader(
      {Key? key, this.decoration = const BoxDecoration(color: Colors.white)})
      : super(key: key);

  factory Loader.circularBorder() {
    return Loader(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) return circularProgress;

    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        decoration: decoration,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
