import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app_demo/api_call/get_all_api.dart';
import 'package:web_app_demo/controller/web_controller.dart';
import 'package:web_app_demo/model/exit_popup_configuration_api/exit_popup_configuration_model.dart';

class ExitPopupConfigurationController extends GetxController {
  WebController webController = Get.put(WebController());
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  ExitPopupConfigurationModel? data;
  RxBool isLoading = false.obs;

  Future<bool> onWillPopTrue(BuildContext context) async {
    if (context.mounted) {
      isLoading.value
          ? showDialog(
        context: context,
        builder: (context) => Platform.isIOS
            ? CupertinoAlertDialog(
          title: data!.data!.enable_Image == false
              ? const SizedBox()
              : CachedNetworkImage(
            imageUrl: '${data!.data!.Image}',
            height: 70.h,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            ),
          ),
          content: Text(
            '${data!.data!.title}',
            style: GoogleFonts.urbanist(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                '${data!.data!.negative_text}',
                style: GoogleFonts.urbanist(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            CupertinoDialogAction(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: Text(
                "${data!.data!.positive_text}",
                style: GoogleFonts.urbanist(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        )
            : AlertDialog(
          title: data!.data!.enable_Image == false
              ? const SizedBox()
              : CachedNetworkImage(
            imageUrl: '${data!.data!.Image}',
            height: 70.h,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          ),
          content: Text(
            '${data!.data!.title}',
            style: GoogleFonts.urbanist(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                '${data!.data!.negative_text}',
                style: GoogleFonts.urbanist(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: Text(
                '${data!.data!.positive_text}',
                style: GoogleFonts.urbanist(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      )
          : const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Future.value(false);
    // var value = await webController.inAppWebViewController!.canGoBack();
    // print('$value');
    // if (value) {
    //   webController.inAppWebViewController!.goBack();
    //   return Future.value(false);
    // } else {
    //   if (context.mounted) {
    //     isLoading.value
    //         ? showDialog(
    //             context: context,
    //             builder: (context) => Platform.isIOS
    //                 ? CupertinoAlertDialog(
    //                     title: data!.data!.enable_Image == false
    //                         ? const SizedBox()
    //                         : CachedNetworkImage(
    //                             imageUrl: '${data!.data!.Image}',
    //                             height: 70.h,
    //                             placeholder: (context, url) => const Center(
    //                               child: CircularProgressIndicator(
    //                                 backgroundColor: Colors.blue,
    //                               ),
    //                             ),
    //                           ),
    //                     content: Text(
    //                       '${data!.data!.title}',
    //                       style: GoogleFonts.urbanist(
    //                         fontSize: 16.sp,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.black,
    //                       ),
    //                       textAlign: TextAlign.center,
    //                     ),
    //                     actions: <Widget>[
    //                       CupertinoDialogAction(
    //                         onPressed: () {
    //                           Navigator.of(context).pop(false);
    //                         },
    //                         child: Text(
    //                           '${data!.data!.negative_text}',
    //                           style: GoogleFonts.urbanist(
    //                             fontSize: 18.sp,
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.blue,
    //                           ),
    //                         ),
    //                       ),
    //                       CupertinoDialogAction(
    //                         onPressed: () {
    //                           SystemNavigator.pop();
    //                         },
    //                         child: Text(
    //                           "${data!.data!.positive_text}",
    //                           style: GoogleFonts.urbanist(
    //                             fontSize: 18.sp,
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.blue,
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   )
    //                 : AlertDialog(
    //                     title: data!.data!.enable_Image == false
    //                         ? const SizedBox()
    //                         : CachedNetworkImage(
    //                             imageUrl: '${data!.data!.Image}',
    //                             height: 70.h,
    //                             placeholder: (context, url) => const Center(
    //                               child: CircularProgressIndicator(
    //                                 color: Colors.blue,
    //                               ),
    //                             ),
    //                           ),
    //                     content: Text(
    //                       '${data!.data!.title}',
    //                       style: GoogleFonts.urbanist(
    //                         fontSize: 16.sp,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.black,
    //                       ),
    //                       textAlign: TextAlign.center,
    //                     ),
    //                     actions: <Widget>[
    //                       TextButton(
    //                         onPressed: () {
    //                           Navigator.of(context).pop(false);
    //                         },
    //                         child: Text(
    //                           '${data!.data!.negative_text}',
    //                           style: GoogleFonts.urbanist(
    //                             fontSize: 18.sp,
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.blue,
    //                           ),
    //                         ),
    //                       ),
    //                       TextButton(
    //                         onPressed: () {
    //                           SystemNavigator.pop();
    //                         },
    //                         child: Text(
    //                           '${data!.data!.positive_text}',
    //                           style: GoogleFonts.urbanist(
    //                             fontSize: 18.sp,
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.blue,
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //           )
    //         : const Center(
    //             child: CircularProgressIndicator(),
    //           );
    //   }
    //
    //   return Future.value(false);
    // }
  }

  Future<bool> onWillPopFalse(BuildContext context) async {
    if (await webController.inAppWebViewController!.canGoBack()) {
      webController.inAppWebViewController!.goBack();
      return false;
    } else {
      return true;
    }
  }

  void getApiData() {
    try {
      client.exitPopupConfigurationData().then((value) {
        data = value;
        isLoading.value = true;
      });
    } catch (_) {
    } finally {
      isLoading.value = false;
    }
  }
}
