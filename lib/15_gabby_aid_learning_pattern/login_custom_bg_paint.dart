import 'package:flutter/material.dart';

class CustomBGGabby extends StatelessWidget {
  const CustomBGGabby({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.7;
    final width = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.teal,
      body: Center(
        child: Container(
          height: height,
          width: width,
          // color: Colors.red,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: ClipPath(
                  clipper: TopClipper(),
                  child: Container(
                    color: Colors.black,
                    height: 0.8 * height,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipPath(
                  clipper: BottomClipper(),
                  child: Container(
                    color: Colors.red,
                    height: 0.4 * height,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double offset = 30;
    path.moveTo(0, offset);
    path.lineTo(0, size.height / 1.5 - offset);
    path.quadraticBezierTo(
        0, size.height / 1.5, offset, size.height / 1.5 + offset / 2);
    path.lineTo(size.width - offset, size.height - offset / 2);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - offset);
    path.lineTo(size.width, offset);
    path.quadraticBezierTo(size.width, 0, size.width - offset, 0);
    path.lineTo(offset, 0);
    path.quadraticBezierTo(0, 0, 0, offset);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double offset = 30;

    path.moveTo(0, offset);
    path.lineTo(0, size.height - offset);
    path.quadraticBezierTo(0, size.height, offset, size.height);
    path.lineTo(size.width - offset, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - offset);
    path.lineTo(size.width, size.height / 1.5 + offset);
    path.quadraticBezierTo(size.width, size.height / 1.5, size.width - offset,
        size.height / 1.5 - offset / 2);
    path.lineTo(offset, offset / 2);
    path.quadraticBezierTo(0, 0, 0, offset);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
