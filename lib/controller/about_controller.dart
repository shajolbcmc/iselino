import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_app_demo/api_call/get_all_api.dart';
import 'package:web_app_demo/model/about_app_configuration_api/about_app_configuration_model.dart';

class AboutController extends GetxController {
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  AboutAppConfigurationModel? data;
  RxBool isLoading = false.obs;

  void getApiData() {
    try {
      client.aboutAppConfigurationData().then((value) {
        data = value;
        isLoading.value = true;
      });
    } catch (_) {
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> openWhatsapp(context) async {
    String whatsapp = data!.data!.whats_app_number!;
    Uri whatsappURlAndroid = whatsapp.length == 15 || whatsapp.length == 13 || whatsapp.length == 14
        ? Uri.parse("whatsapp://send?phone=$whatsapp&text=Hello")
        : Uri.parse(
            "whatsapp://send?phone=+91$whatsapp&text=Hello",
          );
    Uri whatsappURLIos = Uri.parse("https://wa.me/$whatsapp?text=Hello}");
    if (Platform.isIOS) {
      if (await canLaunchUrl(whatsappURLIos)) {
        await launchUrl(whatsappURLIos);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("whatsapp not installed")));
      }
    } else {
      if (await canLaunchUrl(whatsappURlAndroid)) {
        await launchUrl(whatsappURlAndroid);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("whatsapp not installed")));
      }
    }
  }

  Future<void> openInstagram() async {
    Uri instagramURL = Uri.parse(data!.data!.instagram_url!);

    if (await canLaunchUrl(instagramURL)) {
      await launchUrl(instagramURL);
    } else {
      throw 'There was a problem to open the url: $instagramURL';
    }
  }

  Future<void> openTwitter() async {
    Uri twitterURL = Uri.parse(data!.data!.twitter_url!);

    if (await canLaunchUrl(twitterURL)) {
      await launchUrl(twitterURL);
    } else {
      throw 'There was a problem to open the url: $twitterURL';
    }
  }

  Future<void> openFacebook() async {
    Uri facebookURL = Uri.parse(data!.data!.facebook_url!);

    if (await canLaunchUrl(facebookURL)) {
      await launchUrl(facebookURL);
    } else {
      throw 'There was a problem to open the url: $facebookURL';
    }
  }

  Future<void> openContact() async {
    String telephoneNumber = data!.data!.call_number!;
    Uri telephoneUrl = Uri.parse("tel:$telephoneNumber");

    if (await canLaunchUrl(telephoneUrl)) {
      await launchUrl(telephoneUrl);
    } else {
      throw 'There was a problem to open the url: $telephoneUrl';
    }
  }

  Future<void> openSnapchat() async {
    Uri snapchatURL = Uri.parse(data!.data!.snapchat!);

    if (await canLaunchUrl(snapchatURL)) {
      await launchUrl(snapchatURL);
    } else {
      throw 'There was a problem to open the url: $snapchatURL';
    }
  }

  Future<void> openSkype() async {
    Uri skypeURL = Uri.parse(data!.data!.skype!);

    if (await canLaunchUrl(skypeURL)) {
      await launchUrl(skypeURL);
    } else {
      throw 'There was a problem to open the url: $skypeURL';
    }
  }

  Future<void> openMessenger() async {
    Uri messengerURL = Uri.parse(data!.data!.messenger!);

    if (await canLaunchUrl(messengerURL)) {
      await launchUrl(messengerURL);
    } else {
      throw 'There was a problem to open the url: $messengerURL';
    }
  }

  Future<void> openYoutube() async {
    Uri youtubeURL = Uri.parse(data!.data!.youtube!);

    if (await canLaunchUrl(youtubeURL)) {
      await launchUrl(youtubeURL);
    } else {
      throw 'There was a problem to open the url: $youtubeURL';
    }
  }
}
