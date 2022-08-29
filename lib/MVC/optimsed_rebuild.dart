import 'package:flutter/material.dart';

/// UPDATING STATELESS WIDGETS
/// - Stateful builders on statless widgets

class RebuildSreen extends StatelessWidget {
  const RebuildSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var counter = 5;

    return Scaffold(
      body: SafeArea(
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Center(
              child: Column(
                children: [
                  Text('$counter'),
                  ElevatedButton(
                    onPressed: () => {
                      setState(() {
                        counter++;
                      })
                    },
                    child: const Text("Button"),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
