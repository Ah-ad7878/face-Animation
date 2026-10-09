import 'dart:math';

import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  final double animValue;

  Painter({required this.animValue});

  @override
  void paint(Canvas canvas, Size size) {
    final Size(:width, :height) = size;

    final baseRadius = width * 0.35;
    final centerX = width / 2;
    final centerY = height / 2;

    // Angle
    final angle = animValue * 2 * pi;

    final bodyYOffset = -sin(angle * 2) * 8.0;
    final scaleY = 1.0 + (sin(angle * 2) * 0.06);
    final scaleX = 1.0 - (sin(angle * 2) * 0.06);

    // mothion of foot
    final orbitRadiusX = baseRadius * 0.35;
    final orbitRadiusY = baseRadius * 0.25;

    // Front foot
    final frontFootX = centerX * 0.9 + (cos(angle) * orbitRadiusX);
    final frontFootY =
        centerY + (baseRadius * 0.8) + (sin(angle) * orbitRadiusY);

    // Back foot value
    final backFootX = centerX * 0.5 + (cos(angle + pi) * orbitRadiusX);
    final backFootY =
        centerY + (baseRadius * 0.75) + (sin(angle + pi) * orbitRadiusY);

    //Body Center Position
    final bodyCenter = Offset(centerX * 0.85, centerY * 0.85 + bodyYOffset);

    // Foot values
    final footWidth = baseRadius * 0.5;
    final footHeight = baseRadius * 0.3;

    final frontFootRRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(frontFootX, frontFootY),
        width: footWidth,
        height: footHeight,
      ),
      Radius.circular(footHeight / 2),
    );

    final backFootRRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(backFootX, backFootY),
        width: footWidth * 0.9,
        height: footHeight * 0.9,
      ),
      Radius.circular(footHeight / 2),
    );

    // Eyes
    final leftEyeCenter = Offset(
      bodyCenter.dx + (baseRadius * 0.15),
      bodyCenter.dy - (baseRadius * 0.15),
    );
    final leftEyeRadius = baseRadius * 0.20;
    final leftEyePupilCenter = Offset(
      leftEyeCenter.dx + (baseRadius * 0.1),
      leftEyeCenter.dy,
    );
    final leftEyePupilRadius = baseRadius * 0.1;

    final rightEyeCenter = Offset(
      bodyCenter.dx + (baseRadius * 0.55),
      bodyCenter.dy - (baseRadius * 0.2),
    );
    final rightEyeRadius = baseRadius * 0.2;
    final rightPupilCenter = Offset(
      rightEyeCenter.dx + (baseRadius * 0.08),
      rightEyeCenter.dy - (baseRadius * 0.03),
    );
    final rightPupilRadius = baseRadius * 0.09;

    // Mouth
    final mouthRect = Rect.fromLTWH(
      bodyCenter.dx + (baseRadius * 0.35),
      bodyCenter.dy,
      baseRadius * 0.15,
      baseRadius * 0.15,
    );

    // Ground Shadow
    final groundShadowRect = Rect.fromCenter(
      center: Offset(centerX * 0.85, centerY + baseRadius * 1.05),
      width: baseRadius * 1.4 * scaleX,
      height: baseRadius * 0.25 * scaleY,
    );

    // Paints
    final bodyPaint = Paint()
      ..color = const Color(0xFF7CE2FC)
      ..style = PaintingStyle.fill;
    final eyeWhitePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final pupilPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    final mouthPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final frontFootPaint = Paint()
      ..color = const Color(0xFF1D93E3)
      ..style = PaintingStyle.fill;
    final backFootPaint = Paint()
      ..color = const Color(0xFF187BCD)
      ..style = PaintingStyle.fill;
    final shadowPaint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.25)
      ..style = PaintingStyle.fill;

    // Ground Shadow
    canvas.drawOval(groundShadowRect, shadowPaint);

    //Back Foot
    canvas.drawRRect(backFootRRect, backFootPaint);

    //Body
    canvas.save();
    canvas.translate(bodyCenter.dx, bodyCenter.dy);
    canvas.scale(scaleX, scaleY);
    canvas.translate(-bodyCenter.dx, -bodyCenter.dy);

    canvas.drawCircle(bodyCenter, baseRadius, bodyPaint);
    canvas.drawCircle(leftEyeCenter, leftEyeRadius, eyeWhitePaint);
    canvas.drawCircle(leftEyePupilCenter, leftEyePupilRadius, pupilPaint);
    canvas.drawCircle(rightEyeCenter, rightEyeRadius, eyeWhitePaint);
    canvas.drawCircle(rightPupilCenter, rightPupilRadius, pupilPaint);
    canvas.drawArc(mouthRect, 0.0, pi, false, mouthPaint);

    canvas.restore();

    //Front Foot
    canvas.drawRRect(frontFootRRect, frontFootPaint);
  }

  @override
  bool shouldRepaint(covariant Painter oldDelegate) {
    return oldDelegate.animValue != animValue;
  }
}
