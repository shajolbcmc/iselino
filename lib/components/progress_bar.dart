import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:web_app_demo/controller/theme_controller.dart';

class ProgressBar extends StatelessWidget {
  final int progress;

  const ProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    return StepProgressIndicator(
      size: 5.h,
      padding: 0,
      unselectedColor: Colors.white,
      selectedGradientColor: themeController.data?.data?.gradient_enable == true
          ? LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(int.parse('0xff${themeController.data?.data?.theme_color_1?.replaceFirst('#', '')}')),
                Color(int.parse('0xff${themeController.data?.data?.theme_color_2?.replaceFirst('#', '')}'))
              ],
            )
          : null,
      totalSteps: 100,
      currentStep: progress,
    );
  }
}
