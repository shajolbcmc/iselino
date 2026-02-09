import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app_demo/components/custom_appbar.dart';
import 'package:web_app_demo/components/navigation_item.dart';
import 'package:web_app_demo/controller/exit_popup_configuration_controller.dart';
import 'package:web_app_demo/controller/home_controller.dart';
import 'package:web_app_demo/controller/navigation_tab_bar_controller.dart';
import 'package:web_app_demo/controller/theme_controller.dart';
import 'package:web_app_demo/controller/web_controller.dart';
import 'package:web_app_demo/screens/main_screens/settings_screen.dart';
import 'package:web_app_demo/screens/web_screens/in_app_web_view.dart';
import 'package:web_app_demo/screens/web_screens/search_screen.dart';
import 'package:web_app_demo/utils/string_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///Initialize Controllers
  HomeController homeController = Get.put(HomeController());
  ThemeController themeController = Get.put(ThemeController());
  NavigationTabController navigationTabController = Get.put(NavigationTabController());
  WebController webController = Get.put(WebController());
  ExitPopupConfigurationController exitPopupConfigurationController = Get.put(ExitPopupConfigurationController());


  // @override
  // void dispose() {
  //   if (homeController.data?.data?.is_enable_pull_to_refresh == true) {
  //     webController.inAppWebViewController?.dispose();
  //   }
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (homeController.data?.data?.required_exit_popup_screen == true) {
          exitPopupConfigurationController.onWillPopTrue(context);
        } else {
          exitPopupConfigurationController.onWillPopFalse(context);
        }
      },
      child: Scaffold(
        /// Side Drawer Navigation AppBar
        appBar: homeController.data?.data?.navigation_style == 'Side Drawer' ||
                homeController.data?.data?.navigation_style == 'Side Drawer & Bottom Navigation'
            ? PreferredSize(
                preferredSize: const Size(0, kToolbarHeight),
                child: GetBuilder<HomeController>(
                  builder: (controller) {
                    return CustomAppBar(
                      label: homeController.page == 0.0.obs
                          ? "Home"
                          : homeController.page == 1.0.obs
                              ? 'Search'
                              : "Settings",
                      actions: [
                        homeController.page == 1.0.obs
                            ? IconButton(
                                onPressed: () async {
                                  homeController.inAppWebViewController?.reload();
                                  Get.forceAppUpdate();
                                },
                                icon: const Icon(Icons.refresh),
                              )
                            : const SizedBox(),
                      ],
                    );
                  },
                ),
              )
            : null,
        drawer: homeController.data?.data?.navigation_style == 'Side Drawer' ||
                homeController.data?.data?.navigation_style == 'Side Drawer & Bottom Navigation'
            ? Drawer(
                backgroundColor: Colors.white,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 130.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: themeController.data?.data?.gradient_enable == false
                            ? Color(int.parse('0xff${themeController.data?.data?.theme_color?.replaceFirst('#', "")}'))
                            : null,
                        gradient: themeController.data?.data?.gradient_enable == true
                            ? LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(int.parse(
                                      '0xff${themeController.data?.data?.theme_color_1?.replaceFirst('#', '')}')),
                                  Color(int.parse(
                                      '0xff${themeController.data?.data?.theme_color_2?.replaceFirst('#', '')}'))
                                ],
                              )
                            : null,
                      ),
                      child: Text(
                        'Infy Web',
                        style: GoogleFonts.urbanist(
                          fontSize: 25.w,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: StringUtils.navigationItemDetails.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    final Rect rect = Rect.fromLTRB(0, 0, 20.w, 20.w);
                                    if (index.toDouble() == homeController.page.value) {
                                      return LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: themeController.data?.data?.gradient_enable == true
                                            ? [
                                                Color(int.parse(
                                                    '0xff${themeController.data?.data?.theme_color_1?.replaceFirst('#', '')}')),
                                                Color(int.parse(
                                                    '0xff${themeController.data?.data?.theme_color_2?.replaceFirst('#', '')}')),
                                              ]
                                            : [
                                                Color(int.parse(
                                                    '0xff${themeController.data?.data?.theme_color?.replaceFirst('#', '')}')),
                                                Color(int.parse(
                                                    '0xff${themeController.data?.data?.theme_color?.replaceFirst('#', '')}')),
                                              ],
                                      ).createShader(rect);
                                    } else {
                                      return const LinearGradient(
                                        colors: [
                                          Color(0XFFBFBFBF),
                                          Color(0XFFBFBFBF),
                                        ],
                                      ).createShader(rect);
                                    }
                                  },
                                  child: Icon(
                                    StringUtils.navigationItemDetails[index]["icon"],
                                    color: index.toDouble() == homeController.page.value
                                        ? Colors.white
                                        : const Color(0XFFBFBFBF),
                                    size: index.toDouble() == homeController.page.value ? 28.w : 23.w,
                                  ),
                                ),
                                title: Text(
                                  StringUtils.navigationItemDetails[index]["label"],
                                  style: GoogleFonts.urbanist(
                                    fontSize: index.toDouble() == homeController.page.value ? 18.w : 15.w,
                                    fontWeight: FontWeight.w700,
                                    color: index.toDouble() == homeController.page.value ? Colors.black : Colors.grey,
                                  ),
                                ),
                                onTap: () {
                                  homeController.controller.animateToPage(
                                    index,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.decelerate,
                                  );
                                  Navigator.pop(context);
                                },
                                style: ListTileStyle.drawer,
                              ),
                              Divider(
                                thickness: 1,
                                color: index.toDouble() == homeController.page.value
                                    ? Colors.black
                                    : const Color(0XFFBFBFBF),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            : null,
        body: homeController.data?.data?.navigation_style == 'Full Screen'
            ? const InAppWebViewScreen()
            : homeController.data?.data?.navigation_style == 'Tabs'
                ? Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 31.h,
                            // color: Color(int.parse('0xff${themeController.data?.data?.theme_color?.replaceFirst('#', '')}')),
                            decoration: BoxDecoration(
                              color: themeController.data?.data?.gradient_enable == false
                                  ? Color(
                                      int.parse('0xff${themeController.data?.data?.theme_color?.replaceFirst('#', "")}'))
                                  : null,
                              gradient: themeController.data?.data?.gradient_enable == true
                                  ? LinearGradient(
                                      colors: [
                                        Color(int.parse(
                                            '0xff${themeController.data?.data?.theme_color_1?.replaceFirst('#', '')}')),
                                        Color(int.parse(
                                            '0xff${themeController.data?.data?.theme_color_2?.replaceFirst('#', '')}'))
                                      ],
                                    )
                                  : null,
                            ),
                          ),
                          Container(
                            height: 70.h,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              color: themeController.data?.data?.gradient_enable == false
                                  ? Color(
                                      int.parse('0xff${themeController.data?.data?.theme_color?.replaceFirst('#', "")}'))
                                  : null,
                              gradient: themeController.data?.data?.gradient_enable == true
                                  ? LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color(int.parse(
                                            '0xff${themeController.data?.data?.theme_color_1?.replaceFirst('#', '')}')),
                                        Color(int.parse(
                                            '0xff${themeController.data?.data?.theme_color_2?.replaceFirst('#', '')}'))
                                      ],
                                    )
                                  : null,
                            ),
                            child: TabBar(
                              padding: EdgeInsets.symmetric(vertical: 2.r),
                              controller: navigationTabController.controller,
                              tabs: homeController.data?.data?.tab_style == '1'
                                  ? navigationTabController.labelTabs
                                  : homeController.data?.data?.tab_style == '3'
                                      ? navigationTabController.iconTabs
                                      : homeController.data?.data?.tab_style == '2'
                                          ? navigationTabController.iconLabelTabs
                                          : navigationTabController.labelTabs,
                              indicatorColor: Colors.white,
                              indicatorWeight: 2.5.w,
                              unselectedLabelColor: Colors.white,
                              isScrollable: false,
                              labelColor: Colors.white,
                              labelStyle: GoogleFonts.urbanist(
                                fontSize: 20.w,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              unselectedLabelStyle: GoogleFonts.urbanist(
                                fontSize: 18.w,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: navigationTabController.controller,
                          children: const [
                            InAppWebViewScreen(),
                            SearchScreen(),
                            SettingScreen(),
                          ],
                        ),
                      ),
                    ],
                  )
                : Stack(
                    children: [
                      ///Screens
                      Obx(() => homeController.isLoading.value && homeController.data != null
                          ? PageView(
                        controller: homeController.controller,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          InAppWebViewScreen(),
                          SearchScreen(),
                          SettingScreen(),
                        ],
                      )
                          : const Center(child:SizedBox()),
                      ),
                      // PageView(
                      //   controller: homeController.controller,
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   children: const [
                      //     InAppWebViewScreen(),
                      //     SearchScreen(),
                      //     SettingScreen(),
                      //   ],
                      // ),

                      /// Side Drawer Navigation Bar
                      /// Tabs Navigation Bar
                      /// Full Screen Navigation Bar
                      if (homeController.data?.data?.navigation_style == 'Side Drawer' ||
                          homeController.data?.data?.navigation_style == 'Tabs' ||
                          homeController.data?.data?.navigation_style == 'Full Screen')
                        const Text(''),

                      /// Bottom Navigation Navigation Bar
                      if (homeController.data?.data?.navigation_style == 'Bottom Navigation' ||
                          homeController.data?.data?.navigation_style == 'Side Drawer & Bottom Navigation')
                        Obx(
                          () => Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10).r,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withValues(alpha: 0.5),
                                    blurRadius: 20.r,
                                    spreadRadius: 3,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                                borderRadius: homeController.data?.data?.bottom_navigation == '1'
                                    ? BorderRadius.vertical(top: Radius.circular(20.r))
                                    : BorderRadius.circular(40.r),
                              ),
                              margin: homeController.data?.data?.bottom_navigation == '1'
                                  ? null
                                  : const EdgeInsets.symmetric(horizontal: 40, vertical: 40).r,
                              child:homeController.isLoading.value ? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  StringUtils.navigationItemDetails.length,
                                  (index) {
                                    if (homeController.isLoading.value) {
                                      return NavigationItem(
                                        onPressed: () {
                                          homeController.controller.animateToPage(
                                            index,
                                            duration: const Duration(milliseconds: 500),
                                            curve: Curves.decelerate,
                                          );
                                        },
                                        icon: StringUtils.navigationItemDetails[index]["icon"],
                                        // iconColor: Color(int.parse('0xff${themeController.data?.data?.theme_color?.replaceFirst('#', '')}')),
                                        label: StringUtils.navigationItemDetails[index]["label"],
                                        isSelected: index.toDouble() == homeController.page.value,
                                        gradient: index.toDouble() == homeController.page.value
                                            ? LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                colors: [
                                                  themeController.data?.data?.gradient_enable == true
                                                      ? Color(int.parse(
                                                          '0xff${themeController.data?.data?.theme_color_1?.replaceFirst('#', '')}'))
                                                      : Color(int.parse(
                                                          '0xff${themeController.data?.data?.theme_color?.replaceFirst('#', '')}')),
                                                  themeController.data?.data?.gradient_enable == true
                                                      ? Color(int.parse(
                                                          '0xff${themeController.data?.data?.theme_color_2?.replaceFirst('#', '')}'))
                                                      : Color(int.parse(
                                                          '0xff${themeController.data?.data?.theme_color?.replaceFirst('#', '')}')),
                                                ],
                                              )
                                            : const LinearGradient(
                                                colors: [
                                                  Color(0XFFBFBFBF),
                                                  Color(0XFFBFBFBF),
                                                ],
                                              ),
                                      );
                                    } else {
                                      // return SizedBox();
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                ),
                              ) : const Center(child: CircularProgressIndicator()),
                            ),
                          ),
                        ),
                    ],
                  ),
      ),
    );
  }
}
