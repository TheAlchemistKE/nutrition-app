import 'package:flutter/material.dart';

class FoodDetailsNutrientThumb extends SliderComponentShape {
  final double thumbRadius;
  final double thumbHeight;
  final int min;
  final int max;

  FoodDetailsNutrientThumb({
    required this.thumbRadius,
    required this.thumbHeight,
    required this.min,
    required this.max,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final canvas = context.canvas;

    final rRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: center,
        width: thumbHeight * 1.2,
        height: thumbHeight * .6,
      ),
      Radius.circular(thumbRadius * .4),
    );

    final paint = Paint()
      ..color = sliderTheme.activeTrackColor! //Thumb Background Color
      ..style = PaintingStyle.fill;

    var span = TextSpan(
      style: TextStyle(
        fontSize: thumbHeight * .3,
        fontWeight: FontWeight.w700,
        color: sliderTheme.thumbColor,
        height: 1,
      ),
      text: '${getValue(value)}',
    );

    var tp = TextPainter(
      text: span,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    var textCenter = Offset(
      center.dx - (tp.width / 2),
      center.dy - (tp.height / 2),
    );

    canvas.drawRRect(rRect, paint);
    tp.paint(canvas, textCenter);
  }

  String getValue(double value) =>
      (min + (max - min) * value).round().toString();
}
