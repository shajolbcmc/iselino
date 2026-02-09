import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app_demo/components/custom_appbar.dart';
import 'package:web_app_demo/components/progress_bar.dart';
import 'package:web_app_demo/components/progress_bar_style.dart';
import 'package:web_app_demo/controller/progress_bar_style_controller.dart';
import 'package:web_app_demo/controller/web_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PolicyScreen extends StatefulWidget {
  const PolicyScreen({super.key});

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  ProgressBarStyleController progressBarStyleController = Get.put(ProgressBarStyleController());
  WebController webController = Get.put(WebController());
  RxInt progressBar = 0.obs;

  late WebViewController webViewController;

  // void initController(String uri) {
  //   progressBar.value = 0;
  //   try{
  //     print("up----${ progressBar.value}");
  //     // progressBarStyleController.isLoading.value = false;
  //     webViewController = WebViewController()..loadRequest(Uri.parse(uri));
  //
  //   }catch(e){
  //     print(e);
  //   }finally{
  //     if (mounted) {
  //       progressBar.value = 100;
  //       print("low----${ progressBar.value}");
  //       // if (Platform.isAndroid) WebView.platform = AndroidWebView();
  //     }
  //
  //     // progressBarStyleController.isLoading.value = true;
  //   }
  //
  // }

  // void initController(String uri) {
  //   progressBar.value = 0;
  //   try {
  //     webViewController = WebViewController()
  //       ..setNavigationDelegate(
  //         NavigationDelegate(
  //           onPageStarted: (_) => progressBar.value = 0,
  //           onProgress: (progress) {
  //             if (mounted) progressBar.value = progress;
  //           },
  //           onPageFinished: (_) {
  //             if (mounted) progressBar.value = 100;
  //           },
  //         ),
  //       )
  //       ..loadRequest(Uri.parse(uri));
  //   } catch (e) {
  //     debugPrint("Error initializing WebView: $e");
  //   }
  // }


  void initController(String uri) {
    progressBar.value = 0;

    try {
      webViewController = WebViewController()
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (_) => progressBar.value = 0,
            onProgress: (progress) {
              if (mounted) progressBar.value = progress;
            },
            onPageFinished: (_) {
              if (mounted) progressBar.value = 100;
            },
          ),
        )
        ..loadRequest(Uri.parse(uri));
    } catch (e) {
      debugPrint("Error initializing WebView: $e");
    }
  }



  @override
  void initState() {
    super.initState();
    initController("https://docs.google.com/document/d/1pLrY96KD_BbC6b50-qO5HYiHPFJapXPCUC9Fw4ddWTY/edit?usp=sharing");
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(label: "Privacy Policy"),
        body: Obx(
          () {
            return Stack(
              children: [
                Column(
                  children: [
                    ///Progress Bar
                    progressBar.value < 100 ? ProgressBar(progress: progressBar.value) : const SizedBox(),

                    ///WebPage
                    Expanded(
                      child: WebViewWidget(
                        // initialUrl: "https://docs.google.com/document/d/1pLrY96KD_BbC6b50-qO5HYiHPFJapXPCUC9Fw4ddWTY/edit?usp=sharing",
                        // javascriptMode: JavascriptMode.unrestricted,
                        // onProgress: (progress) {
                        //   setState(
                        //     () {
                        //       progressBar = progress ~/ 1;
                        //     },
                        //   );
                        // },

                        controller: webViewController,
                      ),
                    ),
                  ],
                ),
                if (progressBarStyleController.isLoading.value && progressBarStyleController.data?.data?.progress_bar_required == true && progressBar.value < 100)
                  const Align(
                    alignment: Alignment.center,
                    child: ProgressBarStyle(
                      progressColor: Colors.white,
                      height: 55,
                      width: 55,
                      padding: 10,
                      radius: 8,
                    ),
                  )
                // progressBarStyleController.isLoading.value
                //     ? progressBarStyleController.data!.data!.progress_bar_required == false
                //     ? const SizedBox()
                // : progressBar.value != 100
                //     ? const Align(
                //         alignment: Alignment.center,
                //         child: ProgressBarStyle(
                //           progressColor: Colors.white,
                //           height: 55,
                //           width: 55,
                //           padding: 10,
                //           radius: 8,
                //         ),
                //       )
                //     : const SizedBox()
                //     : const Center(
                //   child: CircularProgressIndicator(),
                //   // child: const Align(
                //   //   alignment: Alignment.center,
                //   //   child: ProgressBarStyle(
                //   //     progressColor: Colors.white,
                //   //     height: 55,
                //   //     width: 55,
                //   //     padding: 10,
                //   //     radius: 8,
                //   //   ),
                //   // ),
                // ),
              ],
            );
          },
        )
    );
  }
}
