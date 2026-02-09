// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app_demo/controller/home_controller.dart';

class NavigationItem extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final String? label;
  final bool? isSelected;
  final VoidCallback? onPressed;
  final Gradient? gradient;

  NavigationItem({
    super.key,
    this.icon,
    this.iconColor,
    this.label,
    this.isSelected,
    this.onPressed,
    this.gradient,
  });

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    if (homeController.data!.data!.bottom_navigation == '1') {
      return GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r),
          child: AnimatedContainer(
            height: 50.h,
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
            padding: isSelected == true ? const EdgeInsets.symmetric(horizontal: 20).r : EdgeInsets.zero,
            decoration: isSelected == true
                ? BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(25).r,
                  )
                : null,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                final Rect rect = Rect.fromLTRB(0, 0, 20.w, 20.w);
                return gradient!.createShader(rect);
              },
              child: Icon(
                icon,
                size: 25.w,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    } else if (homeController.data!.data!.bottom_navigation == '2') {
      return GestureDetector(
        onTap: onPressed,
        child: AnimatedContainer(
          height: 45.h,
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate,
          padding: isSelected == true ? const EdgeInsets.symmetric(horizontal: 20).r : EdgeInsets.zero,
          decoration: isSelected == true
              ? BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25).r,
                )
              : null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///Navigation Bar Item Icon
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  final Rect rect = Rect.fromLTRB(0, 0, 20.w, 20.w);
                  return gradient!.createShader(rect);
                },
                child: Icon(
                  icon,
                  size: 25.w,
                  // color: isSelected == true ? iconColor : const Color(0XFFBFBFBF),
                  color: Colors.white,
                ),
              ),
              isSelected == true ? SizedBox(width: 10.w) : const SizedBox(),

              ///Navigation Bar Item Label
              isSelected == true
                  ? AutoSizeText(
                      label!,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.urbanist(
                        fontSize: 16.w,
                        fontWeight: FontWeight.w500,
                        color: const Color(0XFF202020),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      );
    } else if (homeController.data!.data!.bottom_navigation == '3') {
      return GestureDetector(
        onTap: onPressed,
        child: AnimatedContainer(
          height: 48.h,
          duration: const Duration(milliseconds: 400),
          curve: Curves.decelerate,
          padding: isSelected == true ? const EdgeInsets.symmetric(horizontal: 20).r : EdgeInsets.zero,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///Navigation Bar Item Icon
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  final Rect rect = Rect.fromLTRB(0, 0, 20.w, 20.w);
                  return gradient!.createShader(rect);
                },
                child: Icon(
                  icon,
                  size: isSelected == true ? 25.sp : 22.sp,
                  // color: isSelected == true ? iconColor : const Color(0XFFBFBFBF),
                  color: Colors.white,
                ),
              ),
              // isSelected == true ? SizedBox(width: 10.w) : const SizedBox(),

              ///Navigation Bar Item Label
              AutoSizeText(
                label!,
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                  fontSize: isSelected == true ? 14.sp : 10.sp,
                  fontWeight: FontWeight.w500,
                  color: isSelected == true ? Colors.black : const Color(0XFFBFBFBF),
                ),
              )
            ],
          ),
        ),
      );
    }
    return const SizedBox();
  }
}
