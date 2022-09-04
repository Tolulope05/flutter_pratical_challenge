import 'package:flutter/material.dart';

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
  ONE,
  TWO,
  THREE,
  FOUR,
  FIVE,
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
