import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

enum Number {
  ONE,
  TWO,
  THREE,
  FOUR,
  FIVE,
}

class WorkingEnum extends StatelessWidget {
  const WorkingEnum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center()),
    );
  }
}
