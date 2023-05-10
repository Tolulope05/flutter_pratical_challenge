import 'package:flutter/material.dart';
import 'dart:math' as math;

class HangingFrame extends StatefulWidget {
  const HangingFrame({super.key});

  @override
  State<HangingFrame> createState() => _HangingFrameState();
}

class _HangingFrameState extends State<HangingFrame>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
      lowerBound: -2,
      upperBound: 2,
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FrameWidget(
          listenable: _animationController,
        ),
      ),
    );
  }
}

class FrameWidget extends AnimatedWidget {
  const FrameWidget({super.key, required super.listenable});

  @override
  Widget build(BuildContext context) {
    final value = listenable as Animation<double>;
    return Transform.rotate(
      angle: value.value.degreesToRadians(),
      child: SizedBox(
        height: 250,
        width: 300,
        child: CustomPaint(
          painter: FramePainter(),
        ),
      ),
    );
  }
}

class FramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var path2 = Path();
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    var paint2 = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height / 3);
    path.lineTo(size.width, size.height / 3);
    path.close();

    path2.moveTo(0, size.height / 3);
    path2.lineTo(0, size.height);
    path2.lineTo(size.width, size.height);
    path2.lineTo(size.width, size.height / 3);

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

extension DegreeToRadian on num {
  double degreesToRadians() {
    return this * (math.pi / 180.0);
  }
}
