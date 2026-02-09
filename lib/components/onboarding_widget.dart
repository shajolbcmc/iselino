import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app_demo/controller/home_controller.dart';

class OnBoardingWidget extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String subtitle;

  const OnBoardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    if (homeController.data!.data!.walkthrough_style == '1') {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ///OmBoarding Image
          Container(
            height: 490.h,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 30.h),

          ///Title
          AutoSizeText(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.urbanist(
              color: const Color(0XFF202020),
              fontSize: 22.w,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 15.h),

          ///Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0).r,
            child: AutoSizeText(
              subtitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.urbanist(
                color: const Color(0XFF808080),
                fontSize: 16.w,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      );
    } else if (homeController.data!.data!.walkthrough_style == '2') {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ///OmBoarding Image
          Container(
            padding: EdgeInsets.only(top: 165.r),
            color: const Color(0xffF8F8F8),
            width: double.infinity,
            child: Container(
              height: 265.h,
              width: 267.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: 100.h),

          ///Title
          Padding(
            padding: EdgeInsets.only(left: 30.r),
            child: AutoSizeText(
              title,
              textAlign: TextAlign.start,
              style: GoogleFonts.urbanist(
                color: const Color(0XFF202020),
                fontSize: 26.w,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 20.h),

          ///Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0).r,
            child: AutoSizeText(
              subtitle,
              textAlign: TextAlign.start,
              style: GoogleFonts.urbanist(
                color: const Color(0XFF808080),
                fontSize: 16.w,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ///OmBoarding Image
          Container(
            padding: EdgeInsets.only(top: 200.r),
            width: double.infinity,
            child: Container(
              height: 265.h,
              width: 267.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 114.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100.r),
                  topRight: Radius.circular(100.r),
                ),
              ),
              child: Column(
                children: [
                  ///Title
                  AutoSizeText(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.urbanist(
                      color: const Color(0XFF202020),
                      fontSize: 22.w,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 15.h),

                  ///Subtitle
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0).r,
                    child: AutoSizeText(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.urbanist(
                        color: const Color(0XFF808080),
                        fontSize: 16.w,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
  }
}
