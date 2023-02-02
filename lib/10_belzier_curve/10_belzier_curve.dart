import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: BelzierCurve()));
}

class BelzierCurve extends StatelessWidget {
  const BelzierCurve({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('DemoApp'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Stack(
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                child: CustomPaint(
                  painter: OvalArc(),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 25,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black54,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OvalArc extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Paint paint2 = Paint();

    paint.color = Colors.blue;
    paint2.color = Colors.white;
    paint.style = PaintingStyle.stroke;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 1;

    canvas.drawOval(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    canvas.drawOval(
        Rect.fromLTWH(1.5, -3, size.width - 3, size.height), paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class FolderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    double top = 20.0;
    double border1 = 20.0;
    double border2 = 6.0;
    double dst1 = size.width * .62;
    double dst2 = size.width * .62 - 19;

    paint.color = Colors.blue;
    paint.style = PaintingStyle.stroke;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 1;

    path.moveTo(border1, 0);
    path.quadraticBezierTo(0, 0, 0, border1);
    path.lineTo(0, size.height - border1);
    path.quadraticBezierTo(0, size.height, border1, size.height);
    path.lineTo(size.width - border1, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - border1);
    path.lineTo(size.width, top + border1);
    path.quadraticBezierTo(size.width, top, size.width - border1, top);
    path.lineTo(dst1 + border2, top);
    path.quadraticBezierTo(dst1, top, dst1 - border2, top - border2);
    path.lineTo(dst2 + border2, 0 + border2);
    path.quadraticBezierTo(dst2, 0, dst2 - border2, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
