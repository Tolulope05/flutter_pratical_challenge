import 'dart:developer';

import 'package:flutter/material.dart';

class SlidingHover extends StatefulWidget {
  const SlidingHover({super.key, required this.title});
  final String title;

  @override
  State<SlidingHover> createState() => _SlidingHoverState();
}

class _SlidingHoverState extends State<SlidingHover> {
  List<int> monthList = List.generate(12, (index) => index += 1);
  double month = 1;

  double getLeftAlignment() {
    // The Idea here follows that:
    // y = mx + b;
    // First, we can calculate the slope:
    // slope = (y2 - y1) / (x2 - x1) = (1 - (-1)) / (12 - 1) = 2/11
    // Next, we can use one of the points, such as (1, -1), to calculate the y-intercept:
    // -1 = (2/11)(1) + b
    // b = -13/11
    // Therefore, the linear mathematical relationship for the inputs between 1 and 12 is:
    // y = (2/11)x - 13/11
    return (monthList.first - (-1)) / (monthList.length - 1) * month + -13 / 11;
  }

  Align test() {
    log('funcrtion');
    return Align(
      alignment: Alignment(getLeftAlignment(), 0),
      child: SizedBox(
        height: 40,
        width: 120,
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: HoverPainter(),
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.2),
              child: Text(
                '${month.toInt()} month${month.toInt() == 1 ? "" : "s"}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            test(),
            const MyWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Slider.adaptive(
                value: month,
                min: monthList.first.toDouble(),
                max: monthList.last.toDouble(),
                onChanged: (value) => setState(() => month = value),
              ),
            ),
            ElevatedButton(
              onPressed: () => setState(() {}),
              child: const Text('press'),
            ),
          ],
        ),
      ),
    );
  }
}

class HoverPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    path.moveTo(0, 5);
    path.lineTo(0, size.height - 8 - 5);
    path.quadraticBezierTo(0, size.height - 8, 5, size.height - 8);
    path.lineTo(size.width / 2 - 5, size.height - 8);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width / 2 + 5, size.height - 8);
    path.lineTo(size.width - 5, size.height - 8);
    path.quadraticBezierTo(
      size.width,
      size.height - 8,
      size.width,
      size.height - 8 - 5,
    );
    path.lineTo(size.width, 5);
    path.quadraticBezierTo(size.width, 0, size.width - 5, 0);
    path.lineTo(5, 0);
    path.quadraticBezierTo(0, 0, 0, 5);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    log('CLASS');
    return Align(
      alignment: const Alignment(0, 0),
      child: SizedBox(
        height: 40,
        width: 120,
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: HoverPainter(),
              ),
            ),
            const Align(
              alignment: Alignment(0, -0.2),
              child: Text(
                'Some Text',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
