import 'package:flutter/material.dart';
import 'package:flutter_pratical_challenge/08_status_saver/08_flutter_status_saver.dart';
import 'package:flutter_pratical_challenge/09_advnced_pdf_learning/work_file.dart';
import 'package:provider/provider.dart';

import '10_belzier_curve/10_belzier_curve.dart';
import '10_belzier_curve/folder_painter.dart';

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
              primarySwatch: Colors.blue,
            ),
            home: const CustomFolder(),
          );
        });
  }
}
