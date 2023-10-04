import 'package:flutter/material.dart';

/// This is to show how tab bar view works without going through the rigors of too much codes

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CustomTabView(
            //   changeTab: (int int) => model.chnagetabview(int),
            //   index: model.tabView,
            // ),
            SizedBox(height: 30),
            TabBar(
              labelColor: Colors.black,
              tabs: [
                Text("Tolu"),
                Text("Tolu 2"),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                Text("Tolu"),
                Text("Tolu 2"),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
