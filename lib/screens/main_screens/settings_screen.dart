import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:web_app_demo/components/custom_appbar.dart';
import 'package:web_app_demo/controller/home_controller.dart';
import 'package:web_app_demo/controller/share_content_controller.dart';
import 'package:web_app_demo/controller/theme_controller.dart';
import 'package:web_app_demo/utils/string_utils.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    ThemeController themeController = Get.put(ThemeController());
    ShareContentController shareContentController = Get.put(ShareContentController());
    return Scaffold(
      appBar: homeController.data!.data!.navigation_style == 'Side Drawer' ||
              homeController.data!.data!.navigation_style == 'Tabs' ||
              homeController.data!.data!.navigation_style == 'Side Drawer & Bottom Navigation'
          ? null
          : const CustomAppBar(
              label: "Settings",
            ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20).r,
        itemCount: StringUtils.menuItems.length,
        itemBuilder: (context, index) {
          ///Settings Menu Item ListTile
          return Padding(
            padding: const EdgeInsets.only(bottom: 5).r,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10).r,
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15).r,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10).r,
                ),
                onTap: () async {
                  if (index == 1) {
                    if (shareContentController.isLoading.value) {
                      if (shareContentController.data!.data!.content!.isEmpty) {
                        await SharePlus.instance.share(ShareParams(text: "Download this Fantastic App and Share With Your Friends:\n\n : ",));
                      } else {
                         await SharePlus.instance.share(ShareParams(text: (shareContentController.data!.data!.content!)));
                      }
                    } else {
                      const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => StringUtils.menuItems[index]["route"],
                      ),
                    );
                  }
                },
                leading: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    final Rect rect = Rect.fromLTRB(0, 0, 20.w, 20.w);
                    return LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        themeController.data!.data!.gradient_enable == true
                            ? Color(int.parse('0xff${themeController.data!.data!.theme_color_1!.replaceFirst('#', '')}'))
                            : Color(int.parse('0xff${themeController.data!.data!.theme_color!.replaceFirst('#', '')}')),
                        themeController.data!.data!.gradient_enable == true
                            ? Color(int.parse('0xff${themeController.data!.data!.theme_color_2!.replaceFirst('#', '')}'))
                            : Color(int.parse('0xff${themeController.data!.data!.theme_color!.replaceFirst('#', '')}')),
                      ],
                    ).createShader(rect);
                  },
                  child: Icon(
                    StringUtils.menuItems[index]["icon"],
                    size: 28.w,
                    color: Colors.white,
                  ),
                ),
                title: AutoSizeText(
                  StringUtils.menuItems[index]["title"],
                  style: GoogleFonts.urbanist(
                    fontSize: 18.w,
                    fontWeight: FontWeight.w600,
                    color: const Color(0XFF202020),
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Color(0XFFBFBFBF),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
