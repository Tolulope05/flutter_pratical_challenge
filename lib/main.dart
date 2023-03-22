import 'package:flutter/material.dart';
import 'package:flutter_pratical_challenge/08_status_saver/08_flutter_status_saver.dart';
import 'package:flutter_pratical_challenge/15_gabby_aid_learning_pattern/one_custom_triangle_on_rect_card.dart';
import 'package:provider/provider.dart';

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
            home: const CustomTriangRectangleCard(),
          );
        });
  }
}
