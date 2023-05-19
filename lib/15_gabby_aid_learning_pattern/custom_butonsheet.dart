import 'package:flutter/material.dart';

class CustomBtmSheet extends StatefulWidget {
  const CustomBtmSheet({super.key, required this.title});

  final String title;

  @override
  State<CustomBtmSheet> createState() => _CustomBtmSheetState();
}

class _CustomBtmSheetState extends State<CustomBtmSheet> {
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (_) => SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      TextField(
                        focusNode: focusNode,
                      ),
                      const Text(
                        'Hello World',
                        style: TextStyle(fontSize: 20),
                      ),
                      const Text(
                        'Hello World',
                        style: TextStyle(fontSize: 20),
                      ),
                      const Text(
                        'Hello World',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: focusNode.hasFocus
                            ? MediaQuery.of(context).size.height * 0.5
                            : kBottomNavigationBarHeight,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: const Text('Open'),
        ),
      ),
    );
  }
}
