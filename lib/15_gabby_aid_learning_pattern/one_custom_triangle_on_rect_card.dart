import 'package:flutter/material.dart';

class CustomTriangRectangleCard extends StatefulWidget {
  const CustomTriangRectangleCard({super.key});

  @override
  State<CustomTriangRectangleCard> createState() =>
      _CustomTriangRectangleCardState();
}

class _CustomTriangRectangleCardState extends State<CustomTriangRectangleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: kTextTabBarHeight),
            height: 150,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 77, 119, 88),
            ),
            width: MediaQuery.of(context).size.width * 0.85,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    height: 90,
                    width: 130,
                    child: CustomPaint(
                      painter: TrianglePainter(),
                      foregroundPainter: TrianglePainter(
                        strokeColor: Colors.red,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 90,
                    width: 180,
                    margin: const EdgeInsets.only(right: 8),
                    child: CustomPaint(
                      painter: TrianglePainter2(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter({
    this.strokeColor = Colors.black,
    this.strokeWidth = 3,
    this.paintingStyle = PaintingStyle.fill,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      // ..moveTo(0, y)
      ..lineTo(x / 1.5, y)
      ..lineTo(x, y / 1.5)
      ..lineTo(x, 0)
      ..close();
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) => false;
}

class TrianglePainter2 extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter2({
    this.strokeColor = Colors.black,
    this.strokeWidth = 3,
    this.paintingStyle = PaintingStyle.fill,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(TrianglePainter2 oldDelegate) => false;
}
