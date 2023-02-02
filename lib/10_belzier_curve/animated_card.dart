import 'package:flutter/material.dart';
import 'dart:math' as Math;

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: CardWidget(),
        ),
      ),
    );
  }
}

class CardWidget extends StatefulWidget {
  @override
  createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget>
    with SingleTickerProviderStateMixin {
  late Image cardFront;
  late Image cardBack;
  bool showFront = true;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    cardFront = Image.asset("assets/card_front.jpg");
    cardBack = Image.asset("assets/card_back.png");
    // cardFront =
    //     Image.network("https://alex.domenici.net/media/1206/card-front.png");
    // cardBack =
    //     Image.network("https://alex.domenici.net/media/1207/card-back.png");

    // Initialize the animation controller
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 300), value: 0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(cardFront.image, context);
    precacheImage(cardBack.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.rotationX((controller.value) * Math.pi / 2),
                alignment: Alignment.center,
                child: Container(
                  height: MediaQuery.of(context).size.height - 130,
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: showFront ? cardFront : cardBack,
                ),
              );
            },
          ),
          TextButton(
            child: Text("flip me"),
            onPressed: () async {
              // Flip the image
              await controller.forward();
              setState(() => showFront = !showFront);
              await controller.reverse();
            },
          ),
        ],
      ),
    );
  }
}
