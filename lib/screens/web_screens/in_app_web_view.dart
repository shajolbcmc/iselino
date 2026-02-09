import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_app_demo/components/custom_appbar.dart';
import 'package:web_app_demo/components/progress_bar.dart';
import 'package:web_app_demo/components/progress_bar_style.dart';
import 'package:web_app_demo/controller/exit_popup_configuration_controller.dart';
import 'package:web_app_demo/controller/home_controller.dart';
import 'package:web_app_demo/controller/progress_bar_style_controller.dart';
import 'package:web_app_demo/controller/theme_controller.dart';
import 'package:web_app_demo/controller/web_controller.dart';

class InAppWebViewScreen extends StatefulWidget {
  const InAppWebViewScreen({super.key});

  @override
  State<InAppWebViewScreen> createState() => _InAppWebViewScreenState();
}

class _InAppWebViewScreenState extends State<InAppWebViewScreen> {
  WebController webController = Get.put(WebController());
  ThemeController themeController = Get.put(ThemeController());
  HomeController homeController = Get.put(HomeController());
  ProgressBarStyleController progressBarStyleController = Get.put(ProgressBarStyleController());
  ExitPopupConfigurationController exitPopupConfigurationController = Get.put(ExitPopupConfigurationController());
  Location location = Location();
  late PullToRefreshController pullToRefreshController;
  final GlobalKey webViewKey = GlobalKey();


  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   pullToRefreshController =  (homeController.data!.data!.is_enable_pull_to_refresh == false
  //       ? null
  //       :
  //   PullToRefreshController(
  //     onRefresh: () {
  //       webController.inAppWebViewController!.reload();
  //     },
  //     settings: PullToRefreshSettings(
  //       color: Colors.blue,
  //       enabled: true,
  //     ),
  //   ))!;
  // }

  @override
  void initState() {
    super.initState();

    // Initialize only if data is available
    if (homeController.data != null && homeController.data!.data != null) {
      pullToRefreshController = homeController.data!.data!.is_enable_pull_to_refresh == false
          ? PullToRefreshController(
        onRefresh: () {},
        settings: PullToRefreshSettings(enabled: false),
      )
          : PullToRefreshController(
        onRefresh: () {
          webController.inAppWebViewController?.reload();
        },
        settings: PullToRefreshSettings(
          color: Colors.blue,
          enabled: true,
        ),
      );
    } else {
      // Default initialization if data isn't available yet
      pullToRefreshController = PullToRefreshController(
        onRefresh: () {},
        settings: PullToRefreshSettings(enabled: false),
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeController.data!.data!.navigation_style == 'Side Drawer' ||
              homeController.data!.data!.navigation_style == 'Tabs' ||
              homeController.data!.data!.navigation_style == 'Side Drawer & Bottom Navigation'
          ? null
          : const CustomAppBar(
              label: "Home",
            ),
      body: Obx(() {
        return Stack(
          children: [
            Column(
              children: [
                ///Progress Bar
                webController.progress.value != 100 ? ProgressBar(progress: webController.progress.value) : const SizedBox(),

                ///Web View
                Expanded(
                  child: InAppWebView(
                    key:webViewKey ,
                    onDownloadStartRequest: (controller, url) {
                      webController.download(url.url.toString());
                    },
                    onGeolocationPermissionsShowPrompt: (InAppWebViewController controller, String origin) async {
                      bool? result = await showDialog<bool>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Allow access location $origin'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: [
                                  Text('Allow access location $origin'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('Allow'),
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                              ),
                              TextButton(
                                child: const Text('Denied'),
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                              ),
                            ],
                          );
                        },
                      );
                      if (result!) {
                        return GeolocationPermissionShowPromptResponse(
                          origin: origin,
                          allow: true,
                          retain: true,
                        );
                      } else {
                        return GeolocationPermissionShowPromptResponse(
                          origin: origin,
                          allow: false,
                          retain: true,
                        );
                      }
                    },
                    onWebViewCreated: (InAppWebViewController controller) async {
                      webController.inAppWebViewController = controller;
                    },
                    onProgressChanged: (controller, pro) {
                      webController.progress.value = pro ~/ 1;
                      homeController.data!.data!.disable_header == true
                          ? webController.inAppWebViewController!
                              .evaluateJavascript(source: "document.getElementsByTagName('header')[0].style.display='none'")
                          : null;
                      homeController.data!.data!.disable_footer == true
                          ? webController.inAppWebViewController!
                              .evaluateJavascript(source: "document.getElementsByTagName('footer')[0].style.display='none'")
                          : null;
                      if (webController.progress.value == 100) {
                        pullToRefreshController.endRefreshing();
                      }
                    },
                    initialSettings: InAppWebViewSettings(
                      useOnDownloadStart: true,
                      useShouldInterceptRequest: true,
                      useHybridComposition: true,
                      supportZoom: homeController.data!.data!.is_support_zoom_functionality == true ? true : false,
                      javaScriptEnabled: homeController.data!.data!.javascript_enable == true ? true : false,
                    ),
                    // initialOptions: InAppWebViewGroupOptions(
                    //   crossPlatform: InAppWebViewOptions(
                    //     useOnDownloadStart: true,
                    //     useShouldOverrideUrlLoading: true,
                    //     supportZoom: homeController.data!.data!.is_support_zoom_functionality == true ? true : false,
                    //     javaScriptEnabled: homeController.data!.data!.javascript_enable == true ? true : false,
                    //   ),
                    //   android: AndroidInAppWebViewOptions(
                    //     useShouldInterceptRequest: true,
                    //     useHybridComposition: true,
                    //   ),
                    // ),
                    pullToRefreshController: pullToRefreshController,
                    // homeController.data!.data!.is_enable_pull_to_refresh == false
                    //     ? null
                    //     : PullToRefreshController(
                    //         onRefresh: () {
                    //           webController.inAppWebViewController!.reload();
                    //         },
                    //         settings: PullToRefreshSettings(
                    //           color: Colors.blue,
                    //           enabled: true,
                    //         ),
                    //         // options: PullToRefreshOptions(
                    //         //   color: Colors.blue,
                    //         //   enabled: true,
                    //         // ),
                    //       ),
                    initialUrlRequest: URLRequest(
                      url: WebUri(homeController.data!.data!.base_url!),
                    ),

                    shouldOverrideUrlLoading: (controller, navigationAction) async {
                      var uri = navigationAction.request.url!;

                      if (!["http", "https", "file", "chrome", "data", "javascript", "about"].contains(uri.scheme)) {
                        String launchHttpLink = uri.toString().replaceFirst(uri.scheme, "http");
                        if (await canLaunchUrl(Uri.parse(launchHttpLink))) {
                          await launchUrl(Uri.parse(launchHttpLink));
                          return NavigationActionPolicy.CANCEL;
                        }
                      }
                      return NavigationActionPolicy.ALLOW;
                    },
                  ),
                ),
              ],
            ),
            progressBarStyleController.isLoading.value
                ? progressBarStyleController.data!.data!.progress_bar_required == false
                    ? const SizedBox()
                    : webController.progress.value != 100
                        ? const Align(
                            alignment: Alignment.center,
                            child: ProgressBarStyle(
                              progressColor: Colors.white,
                              height: 55,
                              width: 55,
                              padding: 10,
                              radius: 8,
                            ),
                          )
                        : const SizedBox()
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        );
      }),
    );
  }
}
