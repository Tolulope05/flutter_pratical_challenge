import 'package:flutter/material.dart';
import 'package:flutter_pratical_challenge/MVC/enum/working_with_enums.dart';

import 'boarding/onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Enumscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
