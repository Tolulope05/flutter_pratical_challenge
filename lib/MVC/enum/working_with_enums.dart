import 'package:flutter/material.dart';

/// DIDNT QUITE FIGURE THIS OUT BACK THEN */
class Enumscreen extends StatelessWidget {
  const Enumscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
              child: Text("Select the number of chocolate you want ?")),
          PopupMenuButton(itemBuilder: (context) {
            List enums = Number.values;

            print(enums);
            return List.generate(
              enums.length,
              (index) => PopupMenuItem(
                value: NumberSelect().selectnumber(enums[index]),
                onTap: () {
                  print("${enums[index]} selected");
                },
                child: Text("${enums[index]}"),
              ),
            );
          }),
        ],
      )),
    );
  }
}

enum Number {
  ONE, // value of 0
  TWO, // value of 1
  THREE, // value of 2
  FOUR, // value of 3
  FIVE, // value of 4
}

class NumberSelect {
  int selectnumber(Number number) {
    switch (number) {
      case Number.ONE:
        return 1;
      case Number.TWO:
        return 2;
      case Number.THREE:
        return 3;
      case Number.FOUR:
        return 4;
      case Number.FIVE:
        return 5;
      default:
        return 0;
    }
  }
}
