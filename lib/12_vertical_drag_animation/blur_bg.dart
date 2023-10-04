import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

// You could do something like this, by blurring the container child instead.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Blurry Container'),
        ),
        body: Container(
          height: 400,
          width: 500,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/card_back.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ClipRRect(
            // ClipRRect is needed to prevent the blur from overflowing.
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: const Center(
                child: Text(
                  "CHOCOLATE",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Or you could do something like this, by uaing a Stack and a Positioned widget.
Widget optionStack() {
  return SizedBox(
    height: 200,
    child: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('chocolate_image', fit: BoxFit.cover),
        ClipRRect(
          // Clip it cleanly.
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.grey.withOpacity(0.1),
              alignment: Alignment.center,
              child: const Text('CHOCOLATE'),
            ),
          ),
        ),
      ],
    ),
  );
}
