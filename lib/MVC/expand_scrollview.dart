import 'package:flutter/material.dart';

/// Cases when you need to put an expanded, flexible widget in a column that is in a single child scroll view,
/// his is impossible as the expanded will not allow the content to be display
/// => the altrernative is Custom
class CustomScrollViewExample extends StatelessWidget {
  const CustomScrollViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                Flexible(child: Container()),
                Text("Hello Tolulope"),
                Expanded(child: Container()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
