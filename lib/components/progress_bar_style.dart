import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:web_app_demo/controller/progress_bar_style_controller.dart';

class ProgressBarStyle extends StatelessWidget {
  final Color? progressColor;
  final double? height;
  final double? width;
  final double? radius;
  final double? padding;

  const ProgressBarStyle({
    super.key,
    this.progressColor,
    this.height,
    this.width,
    this.padding,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    ProgressBarStyleController progressBarStyleController = Get.put(ProgressBarStyleController());
    if (progressBarStyleController.data?.data?.loader_style == 'RotatingPlane') {
      return Container(
        padding: EdgeInsets.all(padding!.r),
        height: height?.h,
        width: width?.h,
        decoration: BoxDecoration(
          color: const Color(0xffd45100),
          borderRadius: BorderRadius.circular(radius!.r),
        ),
        child: SpinKitRotatingPlain(color: progressColor, size: 25.sp),
      );
    } else if (progressBarStyleController.data?.data?.loader_style == 'DoubleBounce') {
      return Container(
        padding: EdgeInsets.all(radius!.r),
        height: height?.h,
        width: width?.h,
        decoration: BoxDecoration(
          color: const Color(0xff2a3d50),
          borderRadius: BorderRadius.circular(radius!.r),
        ),
        child: SpinKitDoubleBounce(color: progressColor, size: 25.sp),
      );
    } else if (progressBarStyleController.data?.data?.loader_style == 'WanderingCubes') {
      return Container(
        padding: EdgeInsets.all(radius!.r),
        height: height?.h,
        width: width?.h,
        decoration: BoxDecoration(
          color: const Color(0xff217db9),
          borderRadius: BorderRadius.circular(radius!.r),
        ),
        child: SpinKitWanderingCubes(color: progressColor, size: 28.sp),
      );
    } else if (progressBarStyleController.data?.data?.loader_style == 'Pulse') {
      return Container(
        padding: EdgeInsets.all(radius!.r),
        height: height?.h,
        width: width?.h,
        decoration: BoxDecoration(
          color: const Color(0xff7d8a8b),
          borderRadius: BorderRadius.circular(radius!.r),
        ),
        child: SpinKitPulse(color: progressColor, size: 25.sp),
      );
    } else if (progressBarStyleController.data?.data?.loader_style == 'ChasingDots') {
      return Container(
        padding: EdgeInsets.all(radius!.r),
        height: height?.h,
        width: width?.h,
        decoration: BoxDecoration(
          color: const Color(0xfffec95b),
          borderRadius: BorderRadius.circular(radius!.r),
        ),
        child: SpinKitChasingDots(color: progressColor, size: 25.sp),
      );
    } else if (progressBarStyleController.data?.data?.loader_style == 'FadingFour') {
      return Container(
        padding: EdgeInsets.all(radius!.r),
        height: height?.h,
        width: width?.h,
        decoration: BoxDecoration(
          color: const Color(0xff2e2e2e),
          borderRadius: BorderRadius.circular(radius!.r),
        ),
        child: SpinKitFadingFour(color: progressColor, size: 25.sp),
      );
    } else if (progressBarStyleController.data?.data?.loader_style == 'Circle') {
      return Container(
        padding: EdgeInsets.all(radius!.r),
        height: height?.h,
        width: width?.h,
        decoration: BoxDecoration(
          color: const Color(0xff18ad5c),
          borderRadius: BorderRadius.circular(radius!.r),
        ),
        child: SpinKitCircle(color: progressColor, size: 25.sp),
      );
    } else if (progressBarStyleController.data?.data?.loader_style == 'FadingCircle') {
      return Container(
        padding: EdgeInsets.all(radius!.r),
        height: height?.h,
        width: width?.h,
        decoration: BoxDecoration(
          color: const Color(0xff293c4e),
          borderRadius: BorderRadius.circular(radius!.r),
        ),
        child: SpinKitFadingCircle(color: progressColor, size: 25.sp),
      );
    } else if (progressBarStyleController.data?.data?.loader_style == 'FoldingCube') {
      return Container(
        padding: EdgeInsets.all(padding!.r),
        height: height?.h,
        width: width?.h,
        decoration: BoxDecoration(
          color: const Color(0xff19ba9b),
          borderRadius: BorderRadius.circular(radius!.r),
        ),
        child: SpinKitFoldingCube(color: progressColor, size: 25.sp),
      );
    } else if (progressBarStyleController.data?.data?.loader_style == 'RotatingCircle') {
      return Container(
        padding: EdgeInsets.all(padding!.r),
        height: height?.h,
        width: width?.h,
        decoration: BoxDecoration(
          color: const Color(0xff1a79bf),
          borderRadius: BorderRadius.circular(radius!.r),
        ),
        child: SpinKitRotatingCircle(color: progressColor, size: 24.sp),
      );
    } else if (progressBarStyleController.data?.data?.loader_style == 'Wave') {
      return Container(
        padding: EdgeInsets.all(padding!.r),
        height: height?.h,
        width: width?.h,
        decoration: BoxDecoration(
          color: const Color(0xff19ba9b),
          borderRadius: BorderRadius.circular(radius!.r),
        ),
        child: SpinKitWave(color: progressColor, size: 20.sp),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(8.r),
        height: height?.h,
        width: width?.h,
        decoration: BoxDecoration(
          color: const Color(0xfff6a24a),
          borderRadius: BorderRadius.circular(radius!.r),
        ),
        child: SpinKitRing(color: progressColor!, size: 40.sp, lineWidth: 5.w),
      );
    }
  }
}
