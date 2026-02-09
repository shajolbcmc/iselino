import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_app_demo/api_call/get_all_api.dart';
import 'package:web_app_demo/components/common_button.dart';
import 'package:web_app_demo/controller/about_controller.dart';
import 'package:web_app_demo/controller/exit_popup_configuration_controller.dart';
import 'package:web_app_demo/controller/home_controller.dart';
import 'package:web_app_demo/controller/onboarding_controller.dart';
import 'package:web_app_demo/controller/onesignal_configuration_controller.dart';
import 'package:web_app_demo/controller/progress_bar_style_controller.dart';
import 'package:web_app_demo/controller/share_content_controller.dart';
import 'package:web_app_demo/controller/theme_controller.dart';
import 'package:web_app_demo/controller/web_controller.dart';
import 'package:web_app_demo/model/splash_screen_api/splash_model.dart';


class SplashController extends GetxController {
  OnBoardingController onBoardingController = Get.put(OnBoardingController());
  HomeController homeController = Get.put(HomeController());
  ProgressBarStyleController progressBarStyleController = Get.put(ProgressBarStyleController());
  ExitPopupConfigurationController exitPopupConfigurationController = Get.put(ExitPopupConfigurationController());
  ShareContentController shareContentController = Get.put(ShareContentController());
  OnesignalConfigurationController onesignalConfigurationController = Get.put(OnesignalConfigurationController());
  AboutController aboutController = Get.put(AboutController());
  ThemeController themeController = Get.put(ThemeController());
  WebController webController = Get.put(WebController());
  RxBool isFirstTime = true.obs;
  late SharedPreferences preferences;
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  SplashModel? splashDataList;
  RxBool isLoading = false.obs;
  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;
  RxList<ConnectivityResult> connectionStatus = [ConnectivityResult.none].obs;
  final Connectivity connectivity = Connectivity();
  RxBool isDialogOpen = false.obs;


  @override
  void onInit() async {
    checkIsFirstTime();
    connectivitySubscription = connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    initConnectivity();
    // getUrl();
    themeController.getApiData();
    homeController.getApiData();
    progressBarStyleController.getApiData();
    exitPopupConfigurationController.getApiData();
    shareContentController.getApiData();
    aboutController.getApiData();
    onBoardingController.getApiData();
    getApiData();
    initPlatformState();
    super.onInit();
  }




  ///Functionality For Check App is Running First Time
  Future<bool> checkIsFirstTime() async {
    preferences = await SharedPreferences.getInstance();
    isFirstTime.value = preferences.getBool("isFirstTime") ?? true;
    return isFirstTime.value;
  }

  ///Functionality For Get Link From Firebase
  // getUrl() async {
  //   preferences = await SharedPreferences.getInstance();
  //
  //   if (isFirstTime.value == true) {
  //     await firebaseFirestore.collection('data').get().then((value) {
  //       StringUtils.webUrl = value.docs.first.get("url");
  //       update();
  //     });
  //   } else {
  //     StringUtils.webUrl = preferences.getString("currentUrl")!;
  //   }
  // }

  // ignore: unused_field
  String _debugLabelString = "";

  ///Functionality For One Signal Notification
  Future<void> initPlatformState() async {
    await onesignalConfigurationController.getApiData();

    ///One Signal App ID

    // await OneSignal.shared.setAppId(onesignalConfigurationController.data?.data ?? "");
    OneSignal.initialize(onesignalConfigurationController.data?.data ?? "");

    // OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    /// show message in your phone

    // OneSignal.shared.setNotificationOpenedHandler((openedResult) {
    //   openedResult.notification.additionalData;
    // });
    OneSignal.Notifications.addClickListener((event) {
      event.notification.additionalData;
    });

    /// when app is close then you get notification

    // OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
    //   event.complete(null);
    //   _debugLabelString =
    //       "Notification received in foreground notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
    // });
    OneSignal.Notifications.addForegroundWillDisplayListener((OSNotificationWillDisplayEvent event) {
      event.notification.display();
      _debugLabelString = "Notification received in foreground notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
    });
  }

  void getApiData() {
    try {
      client.splashData().then((value) {
        isLoading.value = true;
        splashDataList = value;
      });
    } catch (_) {
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException  {
      return;
    }
    return _updateConnectionStatus(result);
  }


  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    connectionStatus.value = result;

    if (connectionStatus.first == ConnectivityResult.none && !isDialogOpen.value) {
      isDialogOpen.value = true;
      Get.dialog(
        PopScope(
          canPop: false,
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title:  Text(
              'Internet Connection Lost!',
              // style: TextStyle(fontSize: 22, color: Colors.red,),
              style: GoogleFonts.urbanist(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            content:  Text(
              'We are sorry, but it looks like your device is not connected to the internet.Please check your network settings and try again.',
              textAlign: TextAlign.center,
              // style: TextStyle(fontSize: 16, color: Colors.black,),
              style: GoogleFonts.urbanist(
                fontSize: 16.sp,
                // fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            actions: <Widget>[
              CommonButton(
                width: Get.width,
                height: Get.height / 18,
                color: Colors.blue,
                onTap: () {
                },
                borderRadius: BorderRadius.circular(10),
                child: const Text(
                  'Retry',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,

                  ),
                ),
              ),
            ],
          ),
        ),
        barrierDismissible: false,
      );
    } else {
      if (connectionStatus.first != ConnectivityResult.none && isDialogOpen.value) {
        isDialogOpen.value = false;
        Get.back();
        themeController.getApiData();
        if(homeController.page.value == 0){
          homeController.getApiData();
        }
        progressBarStyleController.getApiData();
        exitPopupConfigurationController.getApiData();
        shareContentController.getApiData();
        aboutController.getApiData();
        onBoardingController.getApiData();
        getApiData();
        initPlatformState();
        webController.inAppWebViewController!.reload();
        homeController.inAppWebViewController!.reload();
      }
      // Get.back();
    }
  }
}
