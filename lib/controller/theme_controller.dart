import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:web_app_demo/api_call/get_all_api.dart';
import 'package:web_app_demo/model/theme_style_api/theme_style_model.dart';

class ThemeController extends GetxController {
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  ThemeStyleModel? data;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getApiData();
  }

  void getApiData() {
    try {
      client.themeStyleData().then((value) {
        isLoading.value = true;
        data = value;
      });
    } catch (_) {
    } finally {
      isLoading.value = false;
    }
  }
}
