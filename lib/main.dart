import 'package:flutter/material.dart';
import 'package:flutter_pratical_challenge/08_status_saver/app_one/08_flutter_status_saver.dart';
import 'package:provider/provider.dart';

// import '16_custom_paint/water_ripple.dart';
// import '20_new_learnt_stuffs/list_test/crude_list_test.dart';
// import '20_new_learnt_stuffs/list_test/list_test.dart';
import '20_new_learnt_stuffs/the_solar_system.dart';
// import '20_new_learnt_stuffs/pagination_flutter.dart';

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
              visualDensity: VisualDensity.adaptivePlatformDensity,
              // useMaterial3: true,
            ),
            // home: const DismissibleBotomNav(
            //   title: "Some text",
            // ),
            // home: const CustomBtmSheet(
            //   title: "Spiral Image",
            // ),
            // home: const SpiralImage(
            //   title: "Spiral Image",
            // ),
            // home: const EncryptionHome(),
            // home: PaginationExample(),
            // home: const ListTest(),
            // home: ListTest(),
            // home: AmazingListTest(),
            home: const SolarSystemSpace(),
          );
        });
  }
}
