import 'package:flutter/material.dart';

import 'onboard1.dart';
import 'onboard2.dart';
import 'onboard3.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: controller,
                children: const [
                  OnBoardOne(),
                  OnBoardTwo(),
                  OnBoardThree(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabPageSelector(
                  controller: controller,
                  selectedColor: Colors.greenAccent,
                  color: Colors.grey[300],
                  borderStyle: BorderStyle.none,
                ),
                const SizedBox(width: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const Scaffold(
                              body: Center(child: Text("This is Home!")),
                            )),
                      ),
                    );
                  },
                  child: Container(
                    // width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xfffead0b),
                    ),
                    height: 61,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      // vertical: 23,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      controller.index == 2
                          ? "Aceptar términos \ny condiciones"
                          : "Siguiente",
                      style: const TextStyle(
                        color: Color(0xff131313),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 23,
            ),
            controller.index == 2
                ? const Text(
                    "Continua con experiencia limitada",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff868072),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : const SizedBox(height: 10),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
