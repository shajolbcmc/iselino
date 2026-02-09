import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:web_app_demo/components/onboarding_widget.dart';
import 'package:web_app_demo/controller/home_controller.dart';
import 'package:web_app_demo/controller/onboarding_controller.dart';
import 'package:web_app_demo/utils/string_utils.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingController controller = Get.put(OnBoardingController());
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: homeController.data!.data!.walkthrough_style == '3' ? const Color(0xffF8F8F8) : Colors.white,
      body: homeController.data!.data!.walkthrough_style == '1'

          /// Walkthrough style 1
          ? Stack(
              children: [
                Column(
                  children: [
                    ///OnBoarding Pages
                    Expanded(
                      flex: 9,
                      child: PageView(
                        physics: const BouncingScrollPhysics(),
                        controller: controller.pageController,
                        children: StringUtils.onBoardingDetails
                            .map(
                              (e) => OnBoardingWidget(
                                image: e["image"],
                                title: e["title"],
                                subtitle: e["subtitle"],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20).r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///Page Indicators
                            SmoothPageIndicator(
                              controller: controller.pageController,
                              count: 3,
                              effect: ExpandingDotsEffect(
                                radius: 4.r,
                                dotWidth: 7.w,
                                dotHeight: 8.h,
                                activeDotColor: const Color(0XFFf9ba00),
                                dotColor: const Color(0XFFBFBFBF),
                              ),
                            ),

                            ///Next Page Or Start Button
                            ElevatedButton(
                              onPressed: () => controller.nextPage(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0XFFf9ba00),
                                foregroundColor: Colors.white,
                                textStyle: GoogleFonts.urbanist(
                                  fontSize: 18.w,
                                  fontWeight: FontWeight.w600,
                                ),
                                fixedSize: Size(98.w, 55.h),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30).r,
                                ),
                              ),
                              child: Obx(
                                () => controller.currentPage.value == 2 ? const AutoSizeText("Start") : const AutoSizeText("Next"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                ///Skip Button
                Obx(
                  () => controller.currentPage.value != 2.0
                      ? Positioned(
                          top: 60.h,
                          right: 30.w,
                          child: TextButton(
                            onPressed: () => controller.pageController.animateToPage(
                              2,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.decelerate,
                            ),
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0XFF808080),
                              textStyle: GoogleFonts.urbanist(
                                fontSize: 16.w,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            child: const Text("Skip"),
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            )
          : homeController.data!.data!.walkthrough_style == '2'

              /// Walkthrough style 2
              ? Stack(
                  children: [
                    Column(
                      children: [
                        ///OnBoarding Pages
                        Expanded(
                          flex: 9,
                          child: PageView(
                            physics: const BouncingScrollPhysics(),
                            controller: controller.pageController,
                            children: StringUtils.onBoardingDetails
                                .map(
                                  (e) => OnBoardingWidget(
                                    image: e["image"],
                                    title: e["title"],
                                    subtitle: e["subtitle"],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),

                    ///Page Indicators
                    Positioned(
                      bottom: 65.r,
                      left: 30.r,
                      child: SmoothPageIndicator(
                        controller: controller.pageController,
                        count: 3,
                        effect: ScrollingDotsEffect(
                          activeDotColor: const Color(0XFFf9ba00),
                          dotColor: const Color(0XFFE4E4E4),
                          radius: 0,
                          activeDotScale: 1.3.r,
                          dotWidth: 30.r,
                          dotHeight: 4.r,
                          spacing: 0,
                        ),
                      ),
                    ),

                    ///Next Page Or Start Button
                    Positioned(
                      bottom: 30.r,
                      right: 30.r,
                      child: ElevatedButton(
                        onPressed: () => controller.nextPage(),
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: EdgeInsets.all(28.r),
                          //  padding: EdgeInsets.all(100.r),
                          backgroundColor: const Color(0XFFf9ba00),
                          foregroundColor: Colors.white,
                          elevation: 0,
                        ),
                        child: Obx(
                          () => controller.currentPage.value == 2
                              ? Text(
                                  "Start",
                                  style: GoogleFonts.urbanist(
                                    color: Colors.white,
                                    fontSize: 16.w,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              : Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 18.w,
                                ),
                        ),
                      ),
                    ),
                  ],
                )
              :

              /// Walkthrough style 3
              Stack(
                  children: [
                    Column(
                      children: [
                        ///OnBoarding Pages
                        Expanded(
                          flex: 9,
                          child: PageView(
                            physics: const BouncingScrollPhysics(),
                            controller: controller.pageController,
                            children: StringUtils.onBoardingDetails
                                .map(
                                  (e) => OnBoardingWidget(
                                    image: e["image"],
                                    title: e["title"],
                                    subtitle: e["subtitle"],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),

                    ///Page Indicators
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 190.h,
                          ),
                          SmoothPageIndicator(
                            controller: controller.pageController,
                            count: 3,
                            effect: ScrollingDotsEffect(
                              activeDotColor: const Color(0XFFf9ba00),
                              dotColor: const Color(0XFFBFBFBF),
                              dotWidth: 20.r,
                              dotHeight: 4.r,
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///Next Page Or Start Button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.r, vertical: 30.r),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => controller.nextPage(),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0XFFf9ba00),
                                  foregroundColor: Colors.white,
                                  textStyle: GoogleFonts.urbanist(
                                    fontSize: 18.w,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  fixedSize: Size(0.w, 50.h),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25).r,
                                  ),
                                ),
                                child: Obx(
                                  () => controller.currentPage.value == 2 ? const AutoSizeText("Start") : const AutoSizeText("Next"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}
