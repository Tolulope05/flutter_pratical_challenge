import 'package:flutter/material.dart';

import '../../screens/onboarding/onboard2.dart';

class OnBoardOne extends StatelessWidget {
  const OnBoardOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  "assets/images/onboard_1.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  children: const [
                    Text(
                      "Bienvenido a Viajes Ya",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff131313),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Planea tu viaje. Filtra por región y consigue las mejores ofertas  en un solo lugar.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff131313),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
