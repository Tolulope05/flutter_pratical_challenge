import 'package:flutter/material.dart';

class ListTest extends StatelessWidget {
  const ListTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Test"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: secondList.length,
          itemBuilder: (context, index) {
            secondList.sort();

            String name = secondList[index];
            String nameFirstLetter = secondList[index][0].toUpperCase();
            bool hasSameFirstLetter = true;

            if (index == 0) {
              hasSameFirstLetter = false;
            } else {
              String previousNameFirstLetter =
                  secondList[index - 1][0].toUpperCase();
              hasSameFirstLetter = nameFirstLetter == previousNameFirstLetter;
            }

            if (index == 0 || !hasSameFirstLetter) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  index == 0
                      ? const SizedBox.shrink()
                      : const SizedBox(
                          height: 10,
                        ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      nameFirstLetter,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    child: Center(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Center(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

List<String> secondList = [
  "Liam",
  "Mia",
  "Noah",
  "Olivia",
  "Eva",
  "Felix",
  "Grace",
  "Hannah",
  "Isaac",
  "Jasmine",
  "Kevin",
  "Zane",
  "Lily",
  "Matthew",
  "Oliver",
  "Penelope",
  "Quincy",
  "Rebecca",
  "Samuel",
  "Ethan",
  "Fiona",
  "George",
  "Holly",
  "Xander",
  "Yara",
  "Zachary",
  "Bella",
  "Diana",
  "Theresa",
  "Ulysses",
  "Victoria",
  "William",
  "Isabel",
  "Jacob",
  "Katherine",
  "Aaron",
  "Benjamin",
  "Charlotte",
  "Daniel",
  "Peter",
  "Quinn",
  "Rachel",
  "Samuel",
  "Tessa",
  "Ulysses",
  "Caleb",
  "Violet",
  "William",
  "Xena",
  "Yasmine",
  "Natalie",
  "Alex",
];
