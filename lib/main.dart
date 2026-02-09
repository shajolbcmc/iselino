import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'screens/welcome_screens/get_data_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  /// One signal notification
  // OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
  //   event.complete(event.notification);
  // });
  //
  // OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {});

  /// ------------------ NEW SETUP OF ONE SIGNAL
  //Remove this method to stop OneSignal Debugging
  OneSignal.Notifications.addForegroundWillDisplayListener((OSNotificationWillDisplayEvent event) {
    event.notification.display();
  });

  OneSignal.Notifications.addPermissionObserver((permission) { });


//   OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
//
//   OneSignal.initialize("<YOUR APP ID HERE>");
//
// // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
//   OneSignal.Notifications.requestPermission(true);

  /// Download
  await FlutterDownloader.initialize(debug: true);

  /// Firebase crashlytics
  // FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  /// Firebase analytics
  // FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // analytics.logEvent(
  //   name: 'app_started',
  //   parameters: {
  //     'started': "1234",
  //   },
  // );

  /// web view controller
  if (Platform.isAndroid) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  /// location permission
  await Permission.storage.request();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) {
      runApp(
        ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          builder: (BuildContext context, Widget? child) {
            return const MyApp();
          },
        ),
      );
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetDataScreen(),
    );
  }
}
