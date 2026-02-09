import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_app_demo/api_call/get_all_api.dart';
import 'package:web_app_demo/controller/home_controller.dart';
import 'package:web_app_demo/model/onboarding_title_api/onboarding_title_model.dart';
import 'package:web_app_demo/screens/main_screens/home_screen.dart';

class OnBoardingController extends GetxController {
  ///Initialize Variables
  PageController pageController = PageController();
  HomeController homeController = Get.put(HomeController());
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  OnBoardingTitleModel? data;
  RxBool isLoading = false.obs;
  RxDouble currentPage = 0.0.obs;
  late SharedPreferences preferences;

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(
      () {
        currentPage.value = pageController.page!;
      },
    );
    update();
    getApiData();
  }

  ///Functionality Of Next Page in PageView
  Future<void> nextPage() async {
    if (currentPage.value != 2.0) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
    } else {
      preferences = await SharedPreferences.getInstance();
      await preferences.setBool("isFirstTime", false);
      Get.offAll(
        () => const HomeScreen(),
      );
    }
    update();
  }

  void getApiData() {
    try {
      client.onBoardingTitleData().then((value) {
        isLoading.value = true;
        data = value;
      });
    } catch (_) {
    } finally {
      isLoading.value = false;
    }
  }
}
