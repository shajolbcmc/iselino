import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:web_app_demo/api_call/get_all_api.dart';
import 'package:web_app_demo/model/share_content_api/share_content_model.dart';

class ShareContentController extends GetxController {
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  ShareContentModel? data;
  RxBool isLoading = false.obs;

  void getApiData() {
    try {
      client.shareContentData().then((value) {
        isLoading.value = true;
        data = value;
      });
    } catch (_) {
    } finally {
      isLoading.value = false;
    }
  }
}
