import 'dart:ui';

import 'package:flutter/material.dart';

class LifeIndexPainter extends CustomPainter {
  final int value; // 0–100
  final Color color;

  LifeIndexPainter({required this.value, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 18.0;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // Grey background arc
    final bgPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      3.14,
      3.14,
      false,
      bgPaint,
    );

    // Active (colored) arc
    final activePaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double sweepAngle = 3.14 * (value / 100);

    canvas.drawArc(
      rect,
      3.14,
      sweepAngle,
      false,
      activePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}