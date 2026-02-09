import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app_demo/components/progress_bar_style.dart';
import 'package:web_app_demo/controller/home_controller.dart';
import 'package:web_app_demo/controller/progress_bar_style_controller.dart';
import 'package:web_app_demo/controller/splash_controller.dart';
import 'package:web_app_demo/screens/main_screens/home_screen.dart';
import 'package:web_app_demo/screens/welcome_screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController splashController = Get.put(SplashController());
  HomeController homeController = Get.put(HomeController());
  ProgressBarStyleController progressBarStyleController = Get.put(ProgressBarStyleController());

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.off(
              () => homeController.data!.data!.required_walkthrough == true
              ? splashController.isFirstTime.value == true
              ? const OnBoardingScreen()
              : const HomeScreen()
              : const HomeScreen(),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () {
            if (splashController.isLoading.value) {
              final splashData = splashController.splashDataList!.data!;
              return Stack(
                children: [
                  splashData.enable_splash_background == false
                      ? Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(
                                  int.parse(
                                    '0xff${splashData.first_color!.replaceFirst('#', '')}',
                                  ),
                                ),
                                Color(
                                  int.parse(
                                    '0xff${splashData.second_color!.replaceFirst('#', '')}',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : splashData.enable_splash_logo == true && splashData.enable_splash_background == true
                          ? Center(
                              child: Image.network(splashData.splash_background!),
                            )
                          : Center(
                              child: CachedNetworkImage(
                                imageUrl: splashData.splash_background!,
                                fit: BoxFit.contain,
                                placeholder: (context, url) => Center(
                                  child: progressBarStyleController.isLoading.value == true
                                      ? progressBarStyleController.data!.data!.progress_bar_required == false
                                          ? const CircularProgressIndicator()
                                          : const ProgressBarStyle(
                                              progressColor: Colors.white,
                                              height: 55,
                                              width: 55,
                                              padding: 10,
                                              radius: 8,
                                            )
                                      : const CircularProgressIndicator(),
                                ),
                              ),
                            ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        splashData.enable_splash_logo == false
                            ? const Text('')
                            : CachedNetworkImage(
                                imageUrl: splashData.splash_logo!,
                                fit: BoxFit.contain,
                                height: 185.h,
                                width: 200.w,
                                placeholder: (context, url) => Center(
                                  child: progressBarStyleController.isLoading.value == true
                                      ? progressBarStyleController.data!.data!.progress_bar_required == false
                                          ? const CircularProgressIndicator()
                                          : const ProgressBarStyle(
                                              progressColor: Colors.white,
                                              height: 55,
                                              width: 55,
                                              padding: 10,
                                              radius: 8,
                                            )
                                      : const CircularProgressIndicator(),
                                ),
                              ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        splashData.enable_splash_title == false
                            ? const Text('')
                            : Text(
                                '${splashData.splash_title}',
                                style: GoogleFonts.urbanist(
                                  fontSize: 35.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color(
                                    int.parse('0xff${splashData.splash_title_color!.replaceFirst('#', '')}'),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}


