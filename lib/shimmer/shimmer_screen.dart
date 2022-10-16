import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// This is a shimmer Effect example that shows how to use the shimmer efect
// This is just an example pratical Project

class ShimmerScreen extends StatefulWidget {
  const ShimmerScreen({Key? key}) : super(key: key);

  @override
  State<ShimmerScreen> createState() => _ShimmerScreenState();
}

class _ShimmerScreenState extends State<ShimmerScreen> {
  @override
  void initState() {
    super.initState();
    changeWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: someWidget,
      ),
    );
  }

  Widget randomList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 15,
      itemBuilder: (context, index) => ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.supervised_user_circle_outlined),
        ),
        title: Text("Flutter is the best $index"),
        subtitle: const Text("Tolulope Fakunle"),
        trailing: const Icon(Icons.energy_savings_leaf),
      ),
    );
  }

  Widget loaderList() {
    return Shimmer.fromColors(
      period: const Duration(seconds: 4),
      baseColor: Colors.white,
      highlightColor: Colors.grey,
      child: ListView.builder(
        itemCount: 15,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(backgroundColor: Colors.grey),
            title: Container(
              height: 15,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            subtitle: Container(
              height: 15,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget? someWidget;

  Future? changeWidget() {
    someWidget = loaderList();
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        someWidget = randomList();
      });
    });
    return null;
  }
}
