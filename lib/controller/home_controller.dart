
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:web_app_demo/api_call/get_all_api.dart';
import 'package:web_app_demo/controller/theme_controller.dart';
import 'package:web_app_demo/controller/web_controller.dart';
import 'package:web_app_demo/model/data_api/data_model.dart';

class HomeController extends GetxController {
  ///Initialize Variables
  PageController controller = PageController();
  ThemeController themeController = Get.put(ThemeController());
  WebController webController = Get.put(WebController());
  CookieManager cookieManager = CookieManager.instance();
  InAppWebViewController? inAppWebViewController;
  RxDouble page = 0.0.obs;
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  DataModel? data;
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    controller.addListener(
      () {
        page.value = controller.page!;
        update();
      },
    );
    getApiData();
  }

  void getApiData() {
    try {
      client.data().then((value) {
        data = value;
        isLoading.value = true;
        update();
      });
    } catch (_) {
    } finally {
      isLoading.value = false;
    }
  }



}
