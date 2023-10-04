import 'package:flutter/material.dart';

class OnBoardThree extends StatelessWidget {
  const OnBoardThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Acepta nuestras politicas  para recibir una experiencia personalizada 😊",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xff131313),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Politicas de Privacidad",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xff131313),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Politicas de Partners",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xff131313),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
