import 'package:flutter/material.dart';
import 'package:flutter_pratical_challenge/08_status_saver/app_one/08_flutter_status_saver.dart';
import 'package:provider/provider.dart';

import '15_gabby_aid_learning_pattern/dismissible_botton_navbar.dart';
import '15_gabby_aid_learning_pattern/spiral__image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<StatusSaverNotifier>(
            create: (_) => StatusSaverNotifier(),
          ),
        ],
        builder: (context, widget) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.green,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            // home: const DismissibleBotomNav(
            //   title: "Some text",
            // ),
            home: const SpiralImage(
              title: "Spiral Image",
            ),
          );
        });
  }
}
