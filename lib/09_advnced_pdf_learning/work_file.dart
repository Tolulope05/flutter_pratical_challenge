import 'dart:developer';

import 'package:flutter/material.dart';

class TesTFile extends StatelessWidget {
  const TesTFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> familyMembers = [
      "Tolulope",
      "Fakunle",
      "Oluwayomi",
      "Oluwafikemi",
      "Mayowa Joseph"
    ];

    familyMembers.map((member) {
      return (member.toUpperCase());
    }).forEach((member) {
      log("$member: ${member.length}");
    });
    return const Scaffold();
  }
}
