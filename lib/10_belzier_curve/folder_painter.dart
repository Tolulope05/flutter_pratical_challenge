import 'package:flutter/material.dart';

class CustomFolder extends StatelessWidget {
  const CustomFolder({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('DemoApp'),
      ),
      body: Center(
        child: SizedBox(
          width: 120,
          height: 100,
          child: InkWell(
            onTap: () => debugPrint('object'),
            child: CustomPaint(
              painter: FolderPainter(),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(Icons.gamepad),
                        )),
                    const SizedBox(height: 10),
                    const Text(
                      'Gaming',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      '+20 updates',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FolderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print(size.height);
    Paint paint = Paint();
    Path path = Path();
    double top = 20.0;
    double border1 = 20.0;
    double border2 = 6.0;
    double dst1 = size.width * .62;
    double dst2 = size.width * .62 - 19;

    paint.color = Colors.amber;
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
