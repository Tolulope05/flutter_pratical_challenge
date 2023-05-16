import 'dart:convert';

import 'package:flutter/material.dart';

void downloadBase64String(
  String base64String,
  String fileName,
  BuildContext context,
) async {
  List<int> bytes = base64.decode(base64String);
  String path = "";
}
