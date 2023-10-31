import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Confirmation Dialog Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ConfirmationPage(),
    );
  }
}

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({Key? key}) : super(key: key);

  Future<bool> _onBackPressed(BuildContext context) async {
    // Show the dialog and wait for user response
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Exit'),
          content: const Text('Are you sure you want to exit?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                // User tapped the cancel button, pop the dialog and return false
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('Exit'),
              onPressed: () {
                // User tapped the exit button, pop the dialog and return true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Register the callback function to handle back button press
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Confirmation Dialog Example'),
        ),
        body: const Center(
          child: Text('Press the back button to show the confirmation dialog.'),
        ),
      ),
    );
  }
}
