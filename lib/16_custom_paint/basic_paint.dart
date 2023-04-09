import 'package:flutter/material.dart';

class BasicPaint extends StatelessWidget {
  const BasicPaint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Basic Paint"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomPaint(
              painter: DrawLine(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomPaint(
              painter: DrawRectangle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomPaint(
              painter: DrawCustomPath(),
            ),
          )
        ],
      ),
    );
  }
}

class DrawLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 20.00
      ..color = Colors.blue;
    Offset initialLine = const Offset(50, 0);
    Offset finalLine = const Offset(300, 0);

    /// draw paint
    canvas.drawLine(
      initialLine,
      finalLine,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class DrawRectangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = const Offset(150, 50);
    Paint paint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 20.0;

    Rect rect = Rect.fromCenter(center: center, width: 100, height: 100);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class DrawCustomPath extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path pathone = Path()
      ..moveTo(0, 0)
      // ..lineTo(100, 100)
      ..lineTo(0, 100)
      ..lineTo(0, 0);
    Paint paint = Paint()
      ..color = Colors.greenAccent
      ..strokeWidth = 20;

    canvas.drawPath(pathone, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
