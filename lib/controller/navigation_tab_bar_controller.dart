import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app_demo/utils/string_utils.dart';

class NavigationTabController extends GetxController with GetSingleTickerProviderStateMixin {
  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: labelTabs.length);
  }

  List<Tab> labelTabs = List.generate(
    StringUtils.navigationItemDetails.length,
    (index) => Tab(
      text: StringUtils.navigationItemDetails[index]["label"],
    ),
  );
  List<Tab> iconTabs = List.generate(
    StringUtils.navigationItemDetails.length,
    (index) => Tab(
      icon: Icon(
        StringUtils.navigationItemDetails[index]["icon"],
        size: 28.w,
      ),
    ),
  );
  List<Tab> iconLabelTabs = List.generate(
    StringUtils.navigationItemDetails.length,
    (index) => Tab(
      child: Row(
        children: [
          Icon(StringUtils.navigationItemDetails[index]["icon"], size: 22.w),
          SizedBox(width: 5.w),
          Text(
            StringUtils.navigationItemDetails[index]["label"],
            style: GoogleFonts.urbanist(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );

  TabController? controller;

  @override
  void onClose() {
    controller!.dispose();
    super.onClose();
  }
}
