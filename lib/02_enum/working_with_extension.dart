import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      title: _title,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('hello, world!'.cap)),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: context.toluColor,
            ),
          )
        ],
      ),
    );
  }
}

extension ExtraPack on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  Color get pColor => Theme.of(this).primaryColor;
  Color get toluColor => const Color.fromARGB(255, 77, 119, 88);
}

extension on String {
  String get cap => "${this[0].toUpperCase()}${substring(1)}";
}

extension on int {
  String get toStr => toString();
}
