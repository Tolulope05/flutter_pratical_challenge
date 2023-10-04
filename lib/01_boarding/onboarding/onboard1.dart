import 'package:flutter/material.dart';

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
                child: Image.network(
                  "https://source.unsplash.com/random",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(35.0),
                child: Column(
                  children: [
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
