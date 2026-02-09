import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:web_app_demo/api_call/get_all_api.dart';
import 'package:web_app_demo/model/onesignal_configuration_api/onesignal_configuration_model.dart';

class OnesignalConfigurationController extends GetxController {
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  OnesignalConfigurationModel? data;
  RxBool isLoading = false.obs;

  Future getApiData() async {
    try {
      await client.onesignalConfigurationData().then((value) {
        isLoading.value = true;
        data = value;
      });
    } catch (_) {
    } finally {
      isLoading.value = false;
    }
  }
}
