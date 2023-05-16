import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void downloadBase64String(
  String base64String,
  String fileName,
  BuildContext context,
) async {
  List<int> bytes = base64.decode(base64String);
  Future<PermissionStatus> extStorage =
      Permission.manageExternalStorage.request();
}
