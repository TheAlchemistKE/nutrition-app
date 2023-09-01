import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';

class NetworkImgIcon extends StatelessWidget {
  final Uri uri;
  final Color color;
  final double size;
  final Widget loader;

  const NetworkImgIcon(
    this.uri, {
    Key? key,
    this.color = Colors.white,
    this.size = 64.0,
    this.loader = const SizedBox(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => (kIsWeb) ? imgIconWeb() : imgIcon();

  Widget imgIconWeb() {
    return CustomFutureBuilder(
      source: http.get(uri),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!(snapshot.data is http.Response)) return Container();

        return Image(
          image: MemoryImage(snapshot.data.bodyBytes),
          width: size,
          height: size,
          color: color,
          fit: BoxFit.scaleDown,
          excludeFromSemantics: true,
        );
        // return ImageIcon(
        //   MemoryImage(snapshot.data.bodyBytes),
        //   color: color,
        //   size: size,
        // );
      },
      loader: loader,
      errorHandler: (error) => Container(),
    );
  }

  Widget imgIcon() {
    return CustomFutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!(snapshot.data is ByteData)) return Container();

        final ByteData imageData = snapshot.data;
        return ImageIcon(
          MemoryImage(imageData.buffer.asUint8List()),
          color: color,
          size: size,
        );
      },
      source: NetworkAssetBundle(uri).load(''),
      loader: loader,
      errorHandler: (error) => Container(),
    );
  }
}
