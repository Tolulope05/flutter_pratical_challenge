import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '07_flutter_filter_data/07_flutter_filter_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<FilterDataNotifier>(
            create: (_) => FilterDataNotifier(),
          ),
        ],
        builder: (context, widget) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const FlutterFilterDataView(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
