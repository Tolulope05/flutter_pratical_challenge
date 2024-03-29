import 'package:flutter/material.dart';

class OnBoardTwo extends StatelessWidget {
  const OnBoardTwo({Key? key}) : super(key: key);

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
                padding: EdgeInsets.only(
                    top: 35.0, right: 35.0, left: 35.0, bottom: 15),
                child: Column(
                  children: [
                    Text(
                      "¿Dónde empieza tu aventura?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff131313),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Para mejorar tu experiencia selecciona tu ciudad de origen",
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
