import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneylog/presentation/themes/theme.dart';

class CirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double radius;

  CirclePainter({
    required this.color,
    this.strokeWidth = 10,
    this.radius = 40,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = strokeWidth
      ..color = color
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      radius,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CirclePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.radius != radius;
  }
}
