import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Isolate',
      home: Scaffold(
        backgroundColor: Colors.deepOrange,
        body: ListView(
          padding: const EdgeInsets.only(top: 50),
          children: [
            _buildMarquee(),
          ].map(_wrapWithStuff).toList(),
        ),
        floatingActionButton: Material(
          elevation: 4, // Adjust the elevation to control the shadow effect
          shape: const CircleBorder(),
          color: Colors.blue,

          child: FloatingActionButton.extended(
            onPressed: () async {
              ReceivePort receivePort = ReceivePort();
              Isolate.spawn(performHeavyTaskWithIsolate, receivePort.sendPort);

              // Listen for messages from the spawned isolate
              receivePort.listen((message) {
                debugPrint('$message');
              });
            },
            label: const Text('Perfom heavy task'),
            backgroundColor: Colors.pink,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget _buildMarquee() {
    return Marquee(
      text: 'Isolates are used for concurrent and parallel processing',
      velocity: 50.0,
    );
  }

  Widget _wrapWithStuff(Widget child) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(height: 50, color: Colors.white, child: child),
    );
  }
}

//Simulate a long-running task with an Isolate
void performHeavyTaskWithIsolate(SendPort sendPort) {
  for (int i = 0; i < 5000; i++) {
    debugPrint('$i');
  }
  //Notify the main isolate that the task is complete
  sendPort.send('Task completed');
}

// https://learnwithtunde.hashnode.dev/handle-expensive-or-long-running-tasks-with-an-isolate-to-prevent-an-app-from-freezing