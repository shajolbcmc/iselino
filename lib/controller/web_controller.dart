import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class WebController extends GetxController {
  @override
  void onInit() {
    requestPermission();
    initDownload();
    super.onInit();
  }



  ///Initialize Variables
  InAppWebViewController? inAppWebViewController;
  DownloadStartRequest? downloadStartRequest;
  final ReceivePort _port = ReceivePort();
  RxInt progress = 0.obs;

  ///Functionality For Handling Permission
  void requestPermission() async {
    await [Permission.location].request();
  }

  ///Functionality For Fetch Current Downloads
  static void downloadCallback(String id, int status, int progress) {
    final SendPort send = IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  ///Functionality For Downloads
  void download(String url) async {
    if (Platform.isIOS) {
      Directory directory = await getApplicationDocumentsDirectory();
      await FlutterDownloader.enqueue(
        url: url,
        showNotification: true,
        savedDir: directory.path,
        openFileFromNotification: true,
        saveInPublicStorage: true,
      );
    } else {
      Directory("storage/emulated/0/Documents/WebApp").create(recursive: true).then(
        (Directory directory) async {
          return await FlutterDownloader.enqueue(
            url: url,
            showNotification: true,
            savedDir: directory.path,
            openFileFromNotification: true,
            saveInPublicStorage: true,
          );
        },
      );
    }
  }

  void initDownload() {
    IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      data[0];
      data[1];
      data[2];
    });
    FlutterDownloader.registerCallback(downloadCallback);
  }
}
