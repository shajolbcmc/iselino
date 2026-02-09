import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app_demo/controller/home_controller.dart';
import 'package:web_app_demo/controller/onboarding_controller.dart';
import 'package:web_app_demo/controller/onesignal_configuration_controller.dart';
import 'package:web_app_demo/screens/settings_screens/about_screen.dart';
import 'package:web_app_demo/screens/settings_screens/policy_screen.dart';

class StringUtils {
  static String oneSignalAppId = "e9679928-5190-404f-8416-063a7cb154a8";
  static HomeController homeController = Get.put(HomeController());
  static OnBoardingController onBoardingController = Get.put(OnBoardingController());
  static OnesignalConfigurationController onesignalConfigurationController = Get.put(OnesignalConfigurationController());

  ///OnBoarding Page Details
  static List<Map<String, dynamic>> onBoardingDetails = [
    {
      "image": homeController.data!.data!.walkthrough_style == '1'
          ? const AssetImage("assets/images/on_boarding_style_1/onboarding_1.png")
          : const AssetImage('assets/images/on_boarding_style_2/onboarding_1.png'),
      // "title": homeController.data!.data!.walkthrough_style == '2' ? "Website to\nMobile app" : "Website to mobile app",
      "title": onBoardingController.data!.data![0].title,
      "subtitle": onBoardingController.data!.data![0].subtitle,
    },
    {
      "image": homeController.data!.data!.walkthrough_style == '1'
          ? const AssetImage("assets/images/on_boarding_style_1/onboarding_2.png")
          : const AssetImage('assets/images/on_boarding_style_2/onboarding_2.png'),
      // "title": homeController.data!.data!.walkthrough_style == '2' ? "Geolocation\nSupport" : "Geolocation support",
      "title": onBoardingController.data!.data![1].title,
      "subtitle": onBoardingController.data!.data![1].subtitle,
    },
    {
      "image": homeController.data!.data!.walkthrough_style == '1'
          ? const AssetImage("assets/images/on_boarding_style_1/onboarding_3.png")
          : const AssetImage('assets/images/on_boarding_style_2/onboarding_3.png'),
      // "title": homeController.data!.data!.walkthrough_style == '2' ? "Change app\nTheme" : "Change app theme",
      "title": onBoardingController.data!.data![2].title,
      "subtitle": onBoardingController.data!.data![2].subtitle,
    },
  ];

  ///Settings Menu List
  static List<Map<String, dynamic>> menuItems = [
    {
      "icon": Icons.privacy_tip_rounded,
      "title": "Privacy Policy",
      "route": const PolicyScreen(),
    },
    {
      "icon": Icons.share,
      "title": "Share App",
      "route": null,
    },
    {
      "icon": Icons.info,
      "title": "About",
      "route": const AboutScreen(),
    },
  ];

  ///Navigation Bar Item Details
  static List<Map<String, dynamic>> navigationItemDetails = [
    {
      "icon": Icons.home,
      "label": "Home",
    },
    {
      "icon": Icons.search,
      "label": "Search",
    },
    {
      "icon": Icons.settings,
      "label": "Settings",
    },
  ];

  ///About Screen Detail
  static List<Map<String, dynamic>> aboutDetails = [
    {
      "image": 'assets/images/about_screen_image/whatsapp.png',
      "label": "WhatsApp",
    },
    {
      "image": 'assets/images/about_screen_image/Instagram.png',
      "label": "Instagram",
    },
    {
      "image": 'assets/images/about_screen_image/Twitter.png',
      "label": "Twitter",
    },
    {
      "image": 'assets/images/about_screen_image/facebook.png',
      "label": "Facebook",
    },
    {
      "image": 'assets/images/about_screen_image/contact.png',
      "label": "Contact",
    },
    {
      "image": 'assets/images/about_screen_image/snapchat.png',
      "label": "Snapchat",
    },
    {
      "image": 'assets/images/about_screen_image/skype.png',
      "label": "Skype",
    },
    {
      "image": 'assets/images/about_screen_image/Messenger.png',
      "label": "Messenger",
    },
    {
      "image": 'assets/images/about_screen_image/youtube.png',
      "label": "Youtube",
    },
  ];
}
