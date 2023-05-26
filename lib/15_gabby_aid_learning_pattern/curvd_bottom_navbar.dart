import 'package:flutter/material.dart';
import 'dart:math';

class CurvedBottomNavBarContainerScreen extends StatelessWidget {
  const CurvedBottomNavBarContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          const CurvedBottomNavBarContainer(),
        ],
      ),
    );
  }
}

// Note: You can put this container in a Stack, put the row of icons and
// the FloatingActionButton in Positioned Widgets.

/// Paints a curved bottom navigation bar
/// Note: If the screen width is large (if a phone is in Landscape mode),
/// part of the curve becomes less smooth.
/// To resolve this, we can limit the width based on screenWidth.
/// We can also increase the height of the bar (on big screens)
class CurvedBottomNavBarContainer extends StatelessWidget {
  const CurvedBottomNavBarContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    const double maxSizeofNavBar = 500; // Assumed value

    return Center(
      child: SizedBox(
        width: screenWidth < maxSizeofNavBar ? screenWidth : maxSizeofNavBar,
        height: 106.0,
        child: CustomPaint(
          foregroundPainter: BottomNavPainter(),
        ),
      ),
    );
  }
}

class BottomNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.lightBlueAccent;
    final path = Path();

    // ===== Left Half =====
    path.moveTo(0, size.height * 0.0364);
    path.cubicTo(
      size.width * 0.0792,
      size.height * 0.1525,
      size.width * 0.1982,
      size.height * 0.2287,
      size.width * 0.35,
      size.height * 0.227,
    );
    path.arcTo(
      Rect.fromCircle(
        center: Offset(size.width * 0.35, size.height * 0.355),
        radius: size.height * 0.128,
      ),
      degreeToRadian(270),
      degreeToRadian(90),
      false,
    );
    path.cubicTo(
      size.width * 0.3826,
      size.height * 0.5426,
      size.width * 0.4012,
      size.height * 0.651,
      size.width * 0.5,
      size.height * 0.6534,
    );
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height);
    path.close();
    // Draw left half
    canvas.drawPath(path, paint);

    // ===== Right Half =====
    // Note: Right half is left half flipped. X dimension scales are subtracted
    // from one and angles are reversed (angle = -angle)
    path.moveTo(size.width, size.height * 0.0364);
    path.cubicTo(
      size.width * (1 - 0.0792),
      size.height * 0.1525,
      size.width * (1 - 0.1982),
      size.height * 0.2287,
      size.width * (1 - 0.35),
      size.height * 0.227,
    );
    path.arcTo(
      Rect.fromCircle(
        center: Offset(size.width * (1 - 0.35), size.height * 0.355),
        radius: size.height * 0.128,
      ),
      degreeToRadian(270),
      degreeToRadian(-90),
      false,
    );
    path.cubicTo(
      size.width * (1 - 0.3826),
      size.height * 0.5426,
      size.width * (1 - 0.4012),
      size.height * 0.651,
      size.width * (1 - 0.5),
      size.height * 0.6534,
    );
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    // Draw right half
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

double degreeToRadian(double degrees) {
  return degrees * (pi / 180);
}
