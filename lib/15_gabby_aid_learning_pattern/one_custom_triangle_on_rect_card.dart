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
                        strokeColor: Colors.cyan,
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
          Container(
            margin: const EdgeInsets.only(top: kTextTabBarHeight),
            height: 150,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: const Color.fromARGB(255, 68, 117, 81),
            ),
            width: MediaQuery.of(context).size.width * 0.85,
            child: CustomPaint(
              // painter: DemoPainter(),
              painter: CommentPaint(),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: kTextTabBarHeight),
            height: 150,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: const Color.fromARGB(255, 68, 117, 81),
            ),
            width: MediaQuery.of(context).size.width * 0.85,
            child: CustomPaint(
              painter: DemoPainter(),
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

class CommentPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;

    var path2 = Path();
    const offset = 20.0;
    const cutoff = 30.0;

    path2.moveTo(0, offset);
    path2.lineTo(0, size.height - cutoff - offset);
    path2.quadraticBezierTo(
        0, size.height - cutoff, offset, size.height - cutoff);
    path2.lineTo(40, size.height - cutoff);
    path2.moveTo(40, size.height - cutoff);
    path2.lineTo(40, size.height);
    path2.lineTo(120, size.height - cutoff);
    path2.lineTo(size.width - offset, size.height - cutoff);
    path2.quadraticBezierTo(size.width, size.height - cutoff, size.width,
        size.height - cutoff - offset);
    path2.lineTo(size.width, offset);
    path2.quadraticBezierTo(size.width, 0, size.width - offset, 0);
    path2.lineTo(offset, 0);
    path2.quadraticBezierTo(0, 0, 0, offset);

    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DemoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 20.0;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
