import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:web_app_demo/api_call/get_all_api.dart';
import 'package:web_app_demo/controller/web_controller.dart';
import 'package:web_app_demo/model/progress_bar_style_api/progress_bar_style_model.dart';

class ProgressBarStyleController extends GetxController {
  WebController webController = Get.put(WebController());
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  ProgressBarStyleModel? data;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getApiData();
    super.onInit();
  }

  void getApiData() {
    try {
      client.progressBarStyleData().then((value) {
        data = value;
        isLoading.value = true;
      });
    } catch (_) {
    } finally {
      isLoading.value = false;
    }
  }
}
