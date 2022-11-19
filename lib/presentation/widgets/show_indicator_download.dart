import 'package:flutter/material.dart';

class ShowIndicatorDownload extends CustomPainter {
  double width = 0;
  double height = 1;

  ShowIndicatorDownload({required this.width,required this.height});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 8.0;
    Offset center = Offset(width, size.height * height);
    canvas.drawCircle(center, 150, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
