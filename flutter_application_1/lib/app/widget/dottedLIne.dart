import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/constant/Color.dart';

class DrawDottedhorizontalline extends CustomPainter {
  late Paint _paint;
  DrawDottedhorizontalline() {
    _paint = Paint();
    _paint.color = Abstract.lowColor; //dots color
    _paint.strokeWidth = 1; //dots thickness
    _paint.strokeCap = StrokeCap.square; //dots corner edges
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = -150; i < 150; i = i + 2) {
      if (i % 3 == 0)
        canvas.drawLine(Offset(i, 0.0), Offset(i + 1, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
