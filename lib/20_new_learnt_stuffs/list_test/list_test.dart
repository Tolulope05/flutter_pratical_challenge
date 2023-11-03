import 'package:flutter/material.dart';

import 'name_vm.dart';

class AmazingListTest extends StatefulWidget {
  const AmazingListTest({super.key});

  @override
  State<AmazingListTest> createState() => _AmazingListTestState();
}

class _AmazingListTestState extends State<AmazingListTest> {
  NameVm vm = NameVm();

  @override
  void initState() {
    super.initState();
    vm.addListener(() {
      setState(() {});
    });
    vm.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Amzing List Test"),
      ),
      body: ListView.builder(
        key: const Key('outerListView'),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: vm.nameList.length,
        itemBuilder: (context, index) {
          final entry = vm.nameList.entries.elementAt(index);
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //final map = {'theKey': 'theValue'}; // Map<String, String>
              // var entry = map.entries.first; // MapEntry<String, String>
              // print(entry.key); // 'theKey'
              Text(entry.key),
              const SizedBox(height: 8),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final name = entry.value.elementAt(index);
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.purple,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: Text(name)),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: entry.value.length,
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}

/**
 * class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
 
       
  }
}
 */