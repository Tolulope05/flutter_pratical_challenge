import 'package:flutter/material.dart';
import 'image_screen.dart';
import 'video_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        ImageScreen(),
        VideoScreen(),
      ],
    );
  }
}
