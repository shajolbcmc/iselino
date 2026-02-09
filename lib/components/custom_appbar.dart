import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app_demo/controller/home_controller.dart';
import 'package:web_app_demo/controller/theme_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String label;
  final List<Widget>? actions;

  const CustomAppBar({super.key, required this.label, this.actions});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    ThemeController themeController = Get.put(ThemeController());
    return PreferredSize(
      preferredSize: Size(double.infinity, 55.h),
      child: AppBar(
        titleSpacing: homeController.data?.data?.navigation_style == 'Side Drawer' ||
                homeController.data?.data?.navigation_style == 'Side Drawer & Bottom Navigation'
            ? 0
            : 15.w,
        //backgroundColor: Color(int.parse('0xff${themeController.data!.data!.theme_color!.replaceFirst('#', '')}')),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: themeController.data?.data?.gradient_enable == false
                ? Color(int.parse('0xff${themeController.data?.data?.theme_color?.replaceFirst('#', "")}'))
                : null,
            gradient: themeController.data?.data?.gradient_enable == true
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(int.parse('0xff${themeController.data?.data?.theme_color_1?.replaceFirst('#', '')}')),
                      Color(int.parse('0xff${themeController.data?.data?.theme_color_2?.replaceFirst('#', '')}'))
                    ],
                  )
                : null,
          ),
        ),
        title: homeController.data?.data?.header_style == 'Empty Header'
            ? const Text('')
            : AutoSizeText(
                label,
                style: GoogleFonts.urbanist(
                  fontSize: 20.w,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
        centerTitle: homeController.data?.data?.header_style == 'Left' ? false : true,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
