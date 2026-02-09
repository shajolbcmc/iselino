import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_app_demo/components/custom_appbar.dart';
import 'package:web_app_demo/components/progress_bar.dart';
import 'package:web_app_demo/components/progress_bar_style.dart';
import 'package:web_app_demo/controller/home_controller.dart';
import 'package:web_app_demo/controller/progress_bar_style_controller.dart';
import 'package:web_app_demo/controller/web_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  HomeController homeController = Get.put(HomeController());
  WebController webController = Get.put(WebController());
  ProgressBarStyleController progressBarStyleController = Get.put(ProgressBarStyleController());
  RxInt progress = 0.obs;
  late PullToRefreshController pullToRefreshController;
  final GlobalKey webViewKey = GlobalKey();


  @override
  void initState() {
    super.initState();
    pullToRefreshController = PullToRefreshController(
      onRefresh: ()  {
        homeController.inAppWebViewController!.reload();
      },
      settings: PullToRefreshSettings(
        color: Colors.blue,
        // enabled: true,
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeController.data!.data!.navigation_style == 'Side Drawer' ||
              homeController.data!.data!.navigation_style == 'Tabs' ||
              homeController.data!.data!.navigation_style == 'Side Drawer & Bottom Navigation'
          ? null
          : CustomAppBar(
              label: "Search",
              actions: [
                IconButton(
                  onPressed: () {
                    homeController.inAppWebViewController!.reload();
                  },
                  icon: const Icon(Icons.refresh),
                )
              ],
            ),
      body:Obx(() {
        return  Stack(
          children: [
            Column(
              children: [
                ///Progress Bar
                progress.value != 100 ? ProgressBar(progress: progress.value) : const SizedBox(),

                ///Web View
                Expanded(
                  child: InAppWebView(
                    key: webViewKey,
                    initialUrlRequest: URLRequest(
                      url: WebUri("https://www.google.com"),
                    ),
                    onDownloadStartRequest: (controller, url) {
                      webController.download(url.url.toString());
                    },
                    onWebViewCreated: (InAppWebViewController controller) async {
                      homeController.inAppWebViewController = controller;
                    },
                    onProgressChanged: (controller, pro) {
                      progress.value = pro ~/ 1;
                      if (progress.value == 100) {
                        pullToRefreshController.endRefreshing();
                      }
                    },

                    pullToRefreshController: pullToRefreshController,
                    initialSettings: InAppWebViewSettings(
                      useOnDownloadStart: true,
                      useShouldInterceptRequest: true,
                      useHybridComposition: true,
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
                    // initialOptions: InAppWebViewGroupOptions(
                    //   crossPlatform: InAppWebViewOptions(useOnDownloadStart: true),
                    //   android: AndroidInAppWebViewOptions(
                    //     useShouldInterceptRequest: true,
                    //     useHybridComposition: true,
                    //   ),
                    // ),
                  ),
                ),
              ],
            ),
            progressBarStyleController.isLoading.value
                ? progressBarStyleController.data!.data!.progress_bar_required == false
                ? const SizedBox()
                : progress.value != 100
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
      },)
    );
  }
}
