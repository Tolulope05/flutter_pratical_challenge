import 'dart:math';
import 'package:flutter/material.dart';

class Space extends StatefulWidget {
  const Space({Key? key}) : super(key: key);

  @override
  State<Space> createState() => _SpaceState();
}

class _SpaceState extends State<Space> with TickerProviderStateMixin {
  late AnimationController _earthAnimCon;
  late AnimationController _moonAnimCon;
  late Animation<double> _earthAnim;
  late Animation<double> _moonAnim;

  @override
  void initState() {
    super.initState();
    _earthAnimCon =
        AnimationController(vsync: this, duration: const Duration(seconds: 7));
    _moonAnimCon =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _earthAnim = Tween<double>(begin: 0.0, end: 2 * pi).animate(_earthAnimCon);
    _moonAnim = Tween<double>(begin: 0.0, end: 2 * pi).animate(_moonAnimCon);
    _earthAnimCon.repeat();
    _moonAnimCon.repeat();
  }

  @override
  void dispose() {
    _earthAnimCon.dispose();
    _moonAnimCon.dispose();
    super.dispose();
  }

  final double sunRadius = 80;
  final double earthRadius = 30;
  final double moonRadius = 10;
  final double distanceEarthSun = 180;
  final double distanceEarthMoon = 30;

  double _scale = 1.0;
  double _previousScale = 1.0;

  @override
  Widget build(BuildContext context) {
    // const double sunRadius = 130;
    // const double earthRadius = 30;
    // const double moonRadius = 10;
    // const double distanceEarthSun = 120;
    // const double distanceEarthMoon = 30;

    return DecoratedBox(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/solar_system/space.jpg'),
              fit: BoxFit.cover)),
      child: GestureDetector(
        onScaleStart: (details) {
          _previousScale = _scale;
        },
        onScaleUpdate: (details) {
          setState(() {
            _scale = _previousScale * details.scale;
          });
        },
        child: Center(
          child: AnimatedBuilder(
              animation: _earthAnim,
              builder: (context, child) {
                return Transform(
                  // transform: Matrix4.skewX(.5),
                  // transform: Matrix4.skew(.4, .2)..,
                  // alignment: Alignment.bottomCenter,
                  transform: Matrix4.diagonal3Values(1, 1, 1),
                  child: Boundary(
                    padding: earthRadius + moonRadius,
                    size: distanceEarthSun +
                        distanceEarthMoon +
                        sunRadius +
                        earthRadius * 2 +
                        moonRadius * 2,
                    child: Stack(
                      children: <Widget>[
                        Element(
                          image: 'assets/solar_system/sun.png',
                          dimension: sunRadius,
                          // color: Colors.yellowAccent,
                          // shadows: const <BoxShadow>[
                          //   BoxShadow(
                          //     blurRadius: 30,
                          //     color: Colors.yellowAccent,
                          //     blurStyle: BlurStyle.solid
                          //   )
                          // ],
                        ),
                        AnimatedBuilder(
                          animation: _earthAnimCon,
                          builder: (context, child) => Transform.rotate(
                            angle: _earthAnim.value,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Boundary(
                                padding: moonRadius / 2,
                                size: distanceEarthMoon +
                                    earthRadius +
                                    moonRadius * 2,
                                child: Stack(
                                  children: <Widget>[
                                    // THE EARTH
                                    Element(
                                      image: 'assets/solar_system/earth.png',
                                      dimension: earthRadius,
                                      // color: const Color.fromARGB(255, 11, 161, 236)
                                    ),

                                    // THE MOON
                                    Transform.rotate(
                                      angle: _moonAnim.value,
                                      child: Element(
                                        dimension: moonRadius,
                                        // color: Colors.red,
                                        image: 'assets/solar_system/moon.png',
                                        alignment: Alignment.topCenter,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class Element extends StatelessWidget {
  const Element({
    super.key,
    required this.dimension,
    this.color,
    this.shadows,
    this.image,
    this.alignment = Alignment.center,
  });
  final double dimension;
  final Color? color;
  final List<BoxShadow>? shadows;
  final String? image;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: SizedBox.square(
        dimension: dimension,
        child: DecoratedBox(
          decoration: ShapeDecoration(
              image: image != null
                  ? DecorationImage(image: AssetImage(image!))
                  : null,
              shape: const CircleBorder(),
              color: color,
              shadows: shadows),
        ),
        // child: image == null ? DecoratedBox(
        //   decoration: ShapeDecoration(
        //     shape: const CircleBorder(),
        //     color: color,
        //     shadows: shadows
        //   ),
        // ) : Image.asset(image!),
      ),
    );
  }
}

class Boundary extends StatelessWidget {
  const Boundary({
    Key? key,
    required this.size,
    required this.padding,
    this.child,
  }) : super(key: key);
  final double size;
  final double padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox.square(
          dimension: size,
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(width: .5, color: Colors.grey.shade800),
                  borderRadius: BorderRadius.circular(size / 2)),
            ),
          ),
        ),
        SizedBox.square(
          dimension: size,
          child: child,
        ),
      ],
    );
  }
}
