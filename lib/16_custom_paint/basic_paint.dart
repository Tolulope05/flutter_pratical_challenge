import 'dart:ui' as ui;

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
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 30,
            child: CustomPaint(
              painter: DrawLine(),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 120,
            child: CustomPaint(
              painter: DrawRectangle(),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: CustomPaint(
              painter: DrawCustomPath(),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: CustomPaint(
              painter: DrawCircle(),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: CustomPaint(
              painter: DrawobjectandText(),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10.00
      ..color = Colors.blue;
    Size center = size / 2;
    Offset initialLine = Offset(0, center.height);
    Offset finalLine = Offset(size.width, center.height);

    /// draw paint
    canvas.drawLine(
      initialLine,
      finalLine,
      paint,
    );
    canvas.drawColor(Colors.green, BlendMode.color);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class DrawRectangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, 50);
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
      ..lineTo(0, 100)
      ..lineTo(100, 100)
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

class DrawCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Size center = size / 2;
    Paint paint = Paint()..color = Colors.lime;
    canvas.drawCircle(
      Offset(center.width, center.height),
      15,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class DrawobjectandText extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.84);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.77,
        size.width * 0.52, size.height * 0.84);
    path.quadraticBezierTo(
        size.width * 0.74, size.height * 0.92, size.width, size.height * 0.84);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close(); // wave path
    Paint paint = Paint()
      ..color = Colors.lightBlue
      ..strokeWidth = size.height;
    var center = size / 2;
    var style = const TextStyle(
      color: Colors.black,
      fontSize: 24,
    );

    final ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        fontSize: style.fontSize,
        fontFamily: style.fontFamily,
        fontStyle: style.fontStyle,
        fontWeight: style.fontWeight,
        textAlign: TextAlign.start,
      ),
    )
      ..pushStyle(style.getTextStyle())
      ..addText(
        'Demo Text',
      );
    final ui.Paragraph paragraph = paragraphBuilder.build()
      ..layout(ui.ParagraphConstraints(width: size.width));
    canvas.drawPath(
      path,
      paint,
    ); // for painting the bg
    canvas.drawParagraph(paragraph, Offset(0, center.height));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
