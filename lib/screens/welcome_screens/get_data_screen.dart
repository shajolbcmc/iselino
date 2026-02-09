import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app_demo/controller/home_controller.dart';
import 'package:web_app_demo/controller/splash_controller.dart';
import 'package:web_app_demo/screens/main_screens/home_screen.dart';
import 'package:web_app_demo/screens/welcome_screens/onboarding_screen.dart';
import 'splash_screen.dart';

class GetDataScreen extends StatefulWidget {
  const GetDataScreen({super.key});

  @override
  State<GetDataScreen> createState() => _GetDataScreenState();
}

class _GetDataScreenState extends State<GetDataScreen> {
  SplashController splashController = Get.put(SplashController());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (homeController.isLoading.value) {
            return homeController.data?.data?.required_flash_screen == false && homeController.data?.data?.required_walkthrough == false
                ? const HomeScreen()
                : homeController.data?.data?.required_flash_screen == false
                    ? splashController.isFirstTime.value == true
                        ? const OnBoardingScreen()
                        : const HomeScreen()
                    : const SplashScreen();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}


