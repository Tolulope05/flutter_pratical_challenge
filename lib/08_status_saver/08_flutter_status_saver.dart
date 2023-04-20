import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class StatusSaverConstants {
  static String WHATSAPP_BUSINESS_PATH =
      "/storage/emulated/0/Android/media/com.whatsapp.w4b/WhatsApp Business/Media/.Statuses";
  static String WHATSAPP_PATH =
      "/storage/emulated/0/Android/media/com.whatsapp/WhatsApp/Media/.Statuses";
}

class StatusSaverNotifier extends ChangeNotifier {
// Do the notifier shits here
  List<FileSystemEntity> _getImages = [];
  List<FileSystemEntity> _getvideos = [];

  bool _isWhatsAappAvailable = false;
  bool _isWhatsAappBusinessAvailable = false;

  List<FileSystemEntity> get getImages => _getImages;
  List<FileSystemEntity> get getvideos => _getvideos;

  bool get isWhatsAappBusinessAvailable => _isWhatsAappBusinessAvailable;
  bool get isWhatsAappAvailable => _isWhatsAappAvailable;

  void getStatus(String ext) async {
    final PermissionStatus status = await Permission.storage.request();
    if (status.isDenied) {
      Permission.storage.request();
      log("Permission Denied");
      return;
    }

    if (status.isGranted) {
      final Directory whatsappBusinessDiretory =
          Directory(StatusSaverConstants.WHATSAPP_BUSINESS_PATH);
      final Directory whatsappDiretory =
          Directory(StatusSaverConstants.WHATSAPP_PATH);

      if (whatsappDiretory.existsSync()) {
        final items = whatsappDiretory.listSync(); // list all files and dir
        if (ext == ".mp4") {
          _getvideos =
              items.where((element) => element.path.endsWith(".mp4")).toList();
          notifyListeners();
        } else if (ext == ".jpg") {
          _getImages =
              items.where((element) => element.path.endsWith(".jpg")).toList();
          notifyListeners();
        } else {
          print("These files werent captured: $items");
        }
        _isWhatsAappAvailable = true;
        notifyListeners();
        log(items.toString());
      } else {
        log("No Whatsapp found");
        _isWhatsAappAvailable = false;
        notifyListeners();
      }

      if (whatsappBusinessDiretory.existsSync()) {
        final items =
            whatsappBusinessDiretory.listSync(); // list all files and dir
        if (ext == ".mp4") {
          _getvideos =
              items.where((element) => element.path.endsWith(".mp4")).toList();
          notifyListeners();
        } else if (ext == ".jpg") {
          _getImages =
              items.where((element) => element.path.endsWith(".jpg")).toList();
          notifyListeners();
        } else {
          print("These files werent captured: $items");
        }
        _isWhatsAappBusinessAvailable = true;
        notifyListeners();
        log(items.toString());
      } else {
        log("No Whatsapp found");
        _isWhatsAappBusinessAvailable = false;
        notifyListeners();
      }
    }
  }
}

class StatusSaver extends StatelessWidget {
  const StatusSaver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StatusSaverNotifier controller = Provider.of<StatusSaverNotifier>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text("Whatsapp Status Saver"),
        actions: [
          IconButton(
            onPressed: () {
              controller.getStatus(".mp4");
            },
            icon: const Icon(Icons.video_collection),
          ),
          IconButton(
            onPressed: () {
              controller.getStatus(".jpg");
            },
            icon: const Icon(Icons.image),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.getImages.length,
          itemBuilder: ((context, index) {
            if (controller.getImages[index].path.endsWith(".jpg")) {
              return Container(
                margin: const EdgeInsets.all(10),
                child: Image.file(
                  File(controller.getImages[index].path),
                  fit: BoxFit.cover,
                ),
              );
            } else if (controller.getImages[index].path.endsWith(".mp4")) {
              return Container(
                margin: const EdgeInsets.all(10),
                child: Image.file(
                  File(controller.getImages[index].path),
                  fit: BoxFit.cover,
                ),
              );
            } else {
              return Container();
            }
          }),
        ),
      ),
    );
  }
}
